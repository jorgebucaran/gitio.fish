function __tio_usage
    echo "Usage: tio <url> <slug>"
    echo "       tio <slug> <url>"
    echo "       tio <url>"
    echo
    echo "Tip: ``https://´´ and ``github.com´´ are optional."
    functions -e __tio_usage
end

function tio -d "Create a git.io/<slug> from a GitHub url"
    if set -q argv[3]
        echo "tio: I wasn't expecting this argument '$argv[3]'." > /dev/stderr
        __tio_usage > /dev/stderr

        return 1
    end

    switch "$argv[1]"
        case -h --help
            __tio_usage > /dev/stderr
            return
    end

    set -l url
    set -l slug

    for i in $argv
        switch "$i"
            case http{,s}://github.com\* http{s,}://gist.\?\* http{s,}://raw.githubusercontent.\?\*
                set url "$i"

            case github.com\* gist.\?\* raw.githubusercontent.\?\*
                set url "https://$i"

            case http{,s}://\?\*
                echo "tio: I can only process GitHub urls." > /dev/stderr
                __tio_usage > /dev/stderr
                return 1

            case \?\*/\?\*
                set url "https://github.com/$i"

            case \*
                set slug "$i"
        end
    end

    if test -z "$url"
        echo "tio: I need the url to shorten" > /dev/stderr
        __tio_usage > /dev/stderr
        return 1
    end

    set -l gitio_url (

        fish -c "

        command curl --max-time 10 -si https://git.io -F url=$url -F code=$slug ^ /dev/stderr &
        await

    " | command awk -v slug="$slug" '

        /^Location:/ {
            url = substr($2, 1, length($2) - 1)
        }

        END {
            if (url != "") {
                print(url)
            }

            exit (url == "" || substr(url, 16) != slug && slug != "")
        }
    ')

    if test "$status" -eq 0
        echo "$gitio_url"
    else
        if test -z "$gitio_url"
            echo "tio: I couldn't create a short url for:" > /dev/stderr
            echo "     '$url'" > /dev/stderr
        else
            echo "$gitio_url"

            if test ! -z "$slug"
                set -l uline (set_color -u)
                set -l nc (set_color normal)

                echo "tio: I couldn't assign the slug: '$slug' to your url." > /dev/stderr
            end
        end

        return 1
    end
end
