# Cloudflare Scheduled DNS Policies

This repository provides two shell scripts that interact with the Cloudflare API to create DNS policies with scheduled blocking. These scripts allow you to specify websites or categories to be blocked at scheduled times, enhancing network security and control. The scripts use the Cloudflare API to manage DNS policies efficiently.

## Script Descriptions

### create_dns_policy.sh

The `create_dns_policy.sh` script prompts you to enter Cloudflare account information, DNS policy name, DNS traffic rule, and DNS schedule in JSON format. It then uses this information to create a DNS policy with scheduled blocking based on the provided rules and schedule.

### block_gaming_dns_policy.sh

The `block_gaming_dns_policy.sh` script is an example version of `create_dns_policy.sh` specifically tailored for blocking gaming-related websites and content. It uses predefined traffic rules and a schedule focused on blocking gaming sites during specific times.

## How to Deploy and Run

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/xilverkamui/cloudflare-scheduled-dns-policy.git
2. Navigate to the cloned directory:
   ```bash
   cd cloudflare-scheduled-dns-policy
3. Make the scripts executable:
   ```bash
   chmod +x create_dns_policy.sh block_gaming_dns_policy.sh
4. Run the desired script:
   ```bash
   ./create_dns_policy.sh
   ```
   or
   ```bash
   ./block_gaming_dns_policy.sh
   ```
5. Follow the prompts to input the required information for creating the DNS policy with scheduled blocking.

## External Reference
For more information about the Cloudflare API and how to use it effectively, please refer to:
- https://developers.cloudflare.com/cloudflare-one/policies/gateway/dns-policies/scheduled-dns-policies/
- https://developers.cloudflare.com/api/operations/zero-trust-gateway-rules-create-zero-trust-gateway-rule
- https://developers.cloudflare.com/cloudflare-one/policies/gateway/dns-policies/
- https://developers.cloudflare.com/cloudflare-one/policies/gateway/dns-policies/common-policies/
- https://github.com/cloudflare/cloudflare-docs/blob/production/content/cloudflare-one/policies/gateway/dns-policies/_index.md
