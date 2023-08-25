#!/bin/bash

# Input Cloudflare account information
read -p "Enter your Cloudflare EMAIL: " email
read -p "Enter your Cloudflare API_KEY: " api_key
read -p "Enter your Cloudflare ACCOUNT_ID: " account_id

# Input DNS policy name
read -p "Enter a name for the DNS policy: " dns_policy_name

# Cloudflare API URL
url="https://api.cloudflare.com/client/v4/accounts/${account_id}/gateway/rules"

# JSON data for DNS policy
data='{
    "name": "'"${dns_policy_name}"'",
    "action": "block",
    "traffic": "any(dns.content_category[*] in {100})",
    "enabled": true,
    "schedule": {
        "mon": "05:00-08:00,13:00-18:30",
        "tue": "05:00-08:00,13:00-18:30",
        "wed": "05:00-08:00,13:00-18:30",
        "thu": "05:00-08:00,13:00-18:30",
        "fri": "05:00-08:00",
        "sat": "05:00-08:00",
        "sun": "05:00-08:00"
    }
}'

# Execute cURL request with JSON data
response=$(curl -X POST "$url" \
    -H "X-Auth-Email: $email" \
    -H "X-Auth-Key: $api_key" \
    -H "Content-Type: application/json" \
    --data "$data")

# Check if the request was successful
http_code=$(echo "$response" | awk '{print $2}' | tr -d '\r')
if [ "$http_code" = "200" ]; then
    echo "DNS policy '$dns_policy_name' successfully created with scheduled blocking."
else
    echo "Failed to create DNS policy. HTTP status code: $http_code"
fi

# Replace newline with space for a cleaner display
echo
