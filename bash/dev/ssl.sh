#!/bin/bash

# cd the app's root directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
APP_PATH="$(dirname $(dirname $DIR))"
cd $APP_PATH

# generate a development SSL certificate
cd docker/nginx/ssl
openssl genrsa -des3 -passout pass:foobar -out kudoshell.com.pem 2048
openssl req -passin pass:foobar -new -sha256 -key kudoshell.com.pem -subj "/C=US/ST=CA/O=Warthog, Inc./CN=kudoshell.com" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:kudoshell.com,DNS:www.kudoshell.com")) -out kudoshell.com.csr
openssl x509 -passin pass:foobar -req -days 365 -in kudoshell.com.csr -signkey kudoshell.com.pem -out kudoshell.com.crt
openssl rsa -passin pass:foobar -in kudoshell.com.pem -out kudoshell.com.key
