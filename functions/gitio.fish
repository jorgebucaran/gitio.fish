set -g gitio_version 1.0.1

function gitio -d "Create a git.io URL"
    switch "$argv"
        case -v --version
            echo "gitio, version $gitio_version"
        case "" -h --help
            echo "usage: gitio <url>         create a random git.io URL"
            echo -e "       gitio <code>=<url>  create this URL: \x1b[4mgit.io/<code>\x1b[24m" 
            echo "options:"
            echo "       -v or --version  print gitio version"
            echo "       -h or --help     print this help message"
        case \*
            if set -q argv[2]
                echo "gitio: too many arguments (see `gitio -h`)" >&2
                return 1
            end

            set argv (string split = "$argv")
            set -l url $argv[2]
            set -q argv[2] && set -l code $argv[1] || set url $argv[1]

            if set -q code[1] && not string match --quiet --regex -- "^[A-Za-z0-9.,+!*\$@_-]+\$" $code
                echo "gitio: invalid git.io code: \"$code\"" >&2
                return 1
            end

            if not string match --quiet --regex -- "^https:\/\/(github|(gist|raw)\.githubusercontent|(gist|keyload)\.github)\.com\/[^ \t]+\$" $url
                echo "gitio: invalid URL: \"$url\"" >&2
                return 1 
            end

            set -l opts -si https://git.io --data-urlencode "url=$url"
            set -q code[1] && set opts $opts --data-urlencode code="$code"
            set -l resp (command curl $opts | string collect)
            set -l short (string replace --all \r "" $resp | string match --regex -- "Location: ([^ ]+)")

            if string match --quiet --regex -- "^HTTP/1\.1 422" $resp
                echo "gitio: URL not available: \"https://git.io/$code\" -- try another one" >&2
                return 1
            end
            
            if test -z "$short[2]"
                echo "gitio: host unavailable: https://git.io" >&2
                return 1
            end

            if set -q code[1] && test "$short[2]" != "https://git.io/$code"
                echo "gitio: can't git.io URL for this URL: \"$url\"" >&2
                return 1     
            end

            echo $short[2]
    end
end
