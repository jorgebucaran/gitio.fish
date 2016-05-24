function __tio_usage
    echo "Usage: tio <url> <slug>"
    echo "       tio <slug> <url>"
    echo "       tio <url>"
    echo
    echo "Hint: \"https://\" and \"github.com\" are optional."
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
        echo "tio: I need a url." > /dev/stderr
        __tio_usage > /dev/stderr
        return 1
    end

    if test ! -z "$slug"
        set result (fish -c "
            curl -L git.io/$slug ^ /dev/null &
            await
        ")

        if test "$result" != "No url found for $slug"
            echo "tio: No luck! It seems '$slug' is already assigned to a different url." > /dev/stderr
            return 1
        end
    end


    set -l slug_url (

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
        echo "$slug_url"
    else
        if test -z "$slug_url"
            echo "tio: I couldn't create a slug url for:" > /dev/stderr
            echo "     '$url'" > /dev/stderr
        else
            echo "$slug_url"
            echo "tio: I can't assign a new slug to this url." > /dev/stderr
        end

        return 1
    end
end
