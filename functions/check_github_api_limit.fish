function check_github_api_limit
    curl -I https://api.github.com 2>/dev/null |
        sed -En 's/^x-ratelimit-reset: ([[:digit:]]+)[[:space:]]*$/\1/p' |
        xargs date -r
end
