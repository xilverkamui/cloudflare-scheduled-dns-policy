#!/bin/bash

# Input Cloudflare account information
read -p "Enter your Cloudflare ACCOUNT_ID: " account_id
read -p "Enter your Cloudflare API Token: " api_token

# Input DNS policy name
read -p "Enter a name for the DNS policy: " dns_policy_name

# Cloudflare API URL
url="https://api.cloudflare.com/client/v4/accounts/${account_id}/gateway/rules"

# JSON data for DNS policy with updated schedule and "Kids_Rules" list
data='{
    "name": "'"${dns_policy_name}"'",
    "action": "block",
    "traffic": "any(dns.domains[*] in $ff79956b-95c0-463f-a08e-7c1afe6c7ad0) and dns.location in {\"9d5d7f7fb50642fd8a076ecf95c3e3c0\"}",
    "enabled": true,
    "schedule": {
        "timezone": "Asia/Jakarta",
        "mon": "16:10-17:10,21:10-23:59",
        "tue": "16:10-17:10,21:10-23:59",
        "wed": "16:10-17:10,21:10-23:59",
        "thu": "16:10-17:10,21:10-23:59",
        "sun": "21:10-23:59"
    }
}'

# Execute cURL request with JSON data
response=$(curl -s -o response.json -w "%{http_code}" -X POST "$url" \
    -H "Authorization: Bearer $api_token" \
    -H "Content-Type: application/json" \
    --data "$data")

# Check if the request was successful
if [ "$response" = "200" ]; then
    echo "DNS policy '$dns_policy_name' successfully created with scheduled blocking in Jakarta timezone (GMT+7)."
else
    echo "Failed to create DNS policy. HTTP status code: $response"
    echo "Response details:"
    cat response.json
fi

# Clean up temporary response file
rm -f response.json
