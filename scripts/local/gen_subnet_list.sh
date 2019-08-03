#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Extract "vpc_cidr_base", "subnet_type", and "count" arguments from the input
# into shell variables. jq will ensure that the values are properly formatted
# for consumption by the shell.
eval "$(jq -r '@sh "CIDR=\(.vpc_cidr_base) TYPE=\(.subnet_type) COUNT=\(.count)"')"

# Placeholder for whatever data-fetching logic your script implements
if 
CIDRLIST="$CIDR $TYPE $COUNT"

# Produce a JSON object containing the result value.
# jq will ensure that the value is properly quoted
# and escaped to produce a valid JSON string.
jq -n --arg cidrlist "$CIDRLIST" '{"cidrlist":$cidrlist}'
