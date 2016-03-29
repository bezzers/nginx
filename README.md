# nginx
A repository that creates an nginx container that is customizable through environment variables and that fetches its keys and configuration file from a Vault server.

We need to set five environment variables for this to work:  
`PUBLIC_ADDRESS=app.domain.com` - this sets the address that nginx is expected to be listening on  
`SERVICE_ADDRESS=app.service.consul:port` - this sets the address that the underlying service is at  
`VAULT_SECRET_URL=vault.service.consul:8200/v1/secret/path` - the location of the secrets which expects a cert and key field in the returned data in an entry called nginx  
`VAULT_TOKEN=xxxxxxxxx` - this is the access token to authorize against the Vault server  
`SERVICE_NAME=appname-nginx` - the name to register to the consul server for this nginx instance

We run the image with the following command:
```
docker run -d --name $SERVICE_NAME -e SERVICE_NAME=$SERVICE_NAME \
--dns 172.17.42.1 --dns-search service.consul --dns-search node.consul \
--restart always -p 80:80 -p 443:443 \
-e PUBLIC_ADDRESS=$PUBLIC_ADDRESS -e SERVICE_ADDRESS=$SERVICE_ADDRESS \
-e VAULT_SECRET_URL=$VAULT_SECRET_URL -e VAULT_TOKEN=$VAULT_TOKEN \
docker.io/owlabs/nginx
```

Or in a Windows CMD prompt with:
```
docker run -d --name %SERVICE_NAME% -e SERVICE_NAME=%SERVICE_NAME% ^
--dns 172.17.42.1 --dns-search service.consul --dns-search node.consul ^
--restart always -p 80:80 -p 443:443 ^
--link consul:consul ^
-e PUBLIC_ADDRESS=%PUBLIC_ADDRESS% -e SERVICE_ADDRESS=%SERVICE_ADDRESS% ^
-e VAULT_SECRET_URL=%VAULT_SECRET_URL% -e VAULT_TOKEN=%VAULT_TOKEN% ^
docker.io/owlabs/nginx
```
