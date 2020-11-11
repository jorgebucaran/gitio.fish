set -g gitio_version 1.0.1

function gitio -d "Create a git.io URL"
    switch "$argv"
        case -v --version
            echo gitio version $gitio_version
        case "" -h --help
            echo "usage: gitio <url>        create a random git.io URL"
            echo "       gitio <key>=<url>  create git.io/<key>"
            echo "options:"
            echo "       -v or --version  print gitio version"
            echo "       -h or --help     print this help message"
            echo "examples:"
            echo "       gitio https://github.com/user/repo"
            echo "       gitio gitio=https://github.com/jorgebucaran/gitio.fish"
        case \*
            if set -q argv[2]
                echo "gitio: too many arguments (see `gitio -h`)" >&2
                return 1
            end

            set argv (string split = "$argv")
            set -l url $argv[2]
            set -q argv[2] && set -l key $argv[1] || set url $argv[1]

            if set -q key[1] && not string match --quiet --regex '^[A-Za-z0-9.,+!*$@_-]+$' $key
                echo "gitio: invalid git.io key: \"$key\"" >&2
                return 1
            end

            if not string match --quiet --regex '^https:\/\/(github|(gist|raw)\.githubusercontent|(gist|keyload)\.github)\.com\/[^ \t]+$' $url
                echo "gitio: invalid URL: \"$url\"" >&2
                return 1 
            end

            set -l opts -si https://git.io --data-urlenkey "url=$url"
            set -q key[1] && set opts $opts --data-urlenkey key="$key"
            set -l resp (command curl $opts | string collect)

            if string match --quiet --regex '^HTTP/1\.1 422' $resp
                echo "gitio: key already used: \"$key\" -- try a new one" >&2
                return 1
            end

            set -l short (string replace --all \r "" $resp | string match --regex 'Location: ([^ ]+)')

            if test -z "$short[2]"
                echo "gitio: host unavailable" >&2
                return 1
            end
            
            if set -q key[1] && test "$short[2]" != "https://git.io/$key"
                echo "gitio: \"$url\" already using: \"$short[2]\"" >&2
                return 1     
            end

            echo $short[2]
    end
end
