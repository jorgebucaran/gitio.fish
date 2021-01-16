function gitio --description "Create a git.io URL"
    switch "$argv"
        case -v --version
            echo "gitio, version 1.0.1"
        case "" -h --help
            echo "Usage: gitio <url>         Create a random git.io URL"
            echo "       gitio <code>=<url>  Create a git.io URL like "(set_color --underline)"git.io/<code>"(set_color normal)
            echo "Options:"
            echo "       -v or --version  Print version"
            echo "       -h or --help     Print this help message"
        case \*
            if set --query argv[2]
                echo "gitio: Too many arguments, see `gitio --help`" >&2
                return 1
            end

            set argv (string split -- = "$argv")
            set --local url $argv[-1]
            set --local code
            set --query argv[2] && set code $argv[1]

            if set --query code[1] && ! string match --quiet --regex -- "^[@*+-_,.!\$\w\d]+\$" $code
                echo "gitio: Invalid git.io code: \"$code\"" >&2
                return 1
            end

            if ! string match --quiet --regex -- "^https:\/\/(github|(gist|raw)\.githubusercontent|(gist|keyload)\.github)\.com\/[^\s]+\$" $url
                echo "gitio: Invalid URL: \"$url\"" >&2
                return 1
            end

            set --local options --silent --include https://git.io --data-urlencode "url=$url"
            set --query code[1] && set options $options --data-urlencode code="$code"
            set --local resp (curl $options | string collect)
            set --local tiny (
                string replace --all -- \r "" $resp |
                string replace --filter --regex -- "Location: " ""
            )

            if string match --quiet --regex -- "^HTTP/1\.1 422" $resp
                echo "gitio: URL not available: \"https://git.io/$code\", try another one" >&2
                return 1
            end

            if ! set --query tiny[1]
                echo "gitio: Host unavailable: https://git.io" >&2
                return 1
            end

            if set --query code[1] && test "$tiny" != "https://git.io/$code"
                echo "gitio: Cannot create a git.io URL for this URL: \"$url\"" >&2
                return 1
            end

            echo $tiny
    end
end
