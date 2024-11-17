#!/bin/bash

export $(cat ~/.config/polybar/.env | xargs)

USER=$GITHUB_USER
TOKEN=$GITHUB_TOKEN

REPO_COUNT=0
COMMIT_COUNT=0
PAGE=1
PER_PAGE=100

while true; do
    RESPONSE=$(curl -s -u "$USER:$TOKEN" "https://api.github.com/user/repos?per_page=$PER_PAGE&page=$PAGE")
    REPO_PAGE_COUNT=$(echo "$RESPONSE" | jq '. | length')

    if [ "$REPO_PAGE_COUNT" -eq 0 ]; then
        break
    fi

    REPO_COUNT=$((REPO_COUNT + REPO_PAGE_COUNT))

    for repo in $(echo "$RESPONSE" | jq -r '.[].full_name'); do
        REPO_COMMIT_COUNT=0
        COMMIT_PAGE=1

        while true; do
            COMMITS=$(curl -s -u "$USER:$TOKEN" "https://api.github.com/repos/$repo/commits?author=$USER&per_page=$PER_PAGE&page=$COMMIT_PAGE")
            COMMIT_PAGE_COUNT=$(echo "$COMMITS" | jq '. | length')

            if [ "$COMMIT_PAGE_COUNT" -eq 0 ]; then
                break
            fi

            REPO_COMMIT_COUNT=$((REPO_COMMIT_COUNT + COMMIT_PAGE_COUNT))
            COMMIT_PAGE=$((COMMIT_PAGE + 1))
        done

        COMMIT_COUNT=$((COMMIT_COUNT + REPO_COMMIT_COUNT))
    done

    NEXT_PAGE_LINK=$(echo "$RESPONSE" | grep -o '<https://api.github.com/user/repos.*page=[0-9]+>; rel="next"' | sed 's/.*page=\([0-9]*\).*/\1/')

    if [ -z "$NEXT_PAGE_LINK" ]; then
        break
    fi

    PAGE=$NEXT_PAGE_LINK
done

echo "$REPO_COUNT R/$COMMIT_COUNT C"
