#!/bin/sh

repipe () {
  exec 3>&1
  exec 1>&2
  cat > /tmp/stdin
}

load_source () {
    eval $(
        jq -r '
        {
            "base_url": (.source.base_url // "https://webexapis.com/v1/"),
            "access_token": .source.access_token,
            "room_id": .source.room_id,
        } | to_entries[] | .key + "=" + @sh "\(.value)"' < /tmp/stdin
    )
}

curl_webex() {
    curl \
         -H "Authorization: Bearer ${access_token}" \
         -H "Accept: application/json" \
         -H "Content-Type: application/json" \
         ${@} > /tmp/curl_webex_output
}
