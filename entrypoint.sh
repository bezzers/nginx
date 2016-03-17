# Fetch the certificate and private key from the Vault URL
# -k allows us to trust the certificates without verifying them
# -L allows us to be redirected between vault servers
# jq lets us parse the json, -r makes sure new line characters come through properly, sed removes surrounding quotes
curl -k -L -H "X-Vault-Token: $VAULT_TOKEN" -X GET https://$VAULT_SECRET_URL/nginx | jq -r '.data.key' | sed 's/"//g' > /etc/nginx/cert.key
curl -k -L -H "X-Vault-Token: $VAULT_TOKEN" -X GET https://$VAULT_SECRET_URL/nginx | jq -r '.data.cert' | sed 's/"//g' > /etc/nginx/cert.crt

# Populate the template for the configuration file with the relevant environment variables
envsubst < /etc/nginx/nginx-template.conf > /etc/nginx/nginx.conf

# Start nginx
nginx -g daemon off