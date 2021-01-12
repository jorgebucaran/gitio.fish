set --global code piyopoyo

@test "gitio url" (
    function curl
        echo "Content-Type: text/html;charset=utf-8"
        echo "Location: https://git.io/$code"
        echo "Content-Length: 33"

        emit curl_argv $argv
    end

    function curl_argv --on-event curl_argv
        @test "git.io" $argv[3] = "https://git.io"
        @test "github.com url" "$argv[4..5]" = "--data-urlencode url=https://github.com/$code/$code"
        @test "code=$code" "$argv[6..7]" = "--data-urlencode code=$code"
    end

    gitio $code=https://github.com/$code/$code

) = https://git.io/$code
