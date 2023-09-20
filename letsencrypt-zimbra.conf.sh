#!/bin/bash

# get domain for cert
PRINCIPAL="fqdn"
#ADDITIONAL="another.fqdn, another.fqdn" 
#CN=$PRINCIPAL", "$ADDITIONAL
CN="$PRINCIPAL"
# zimbra-letsencrypt folder
letsencrypt_zimbra_dir="/usr/bin/zimbra-letsencrypt"

# letsencrypt tool
letsencrypt="/usr/bin/certbot"
# letsencrypt live directory
letsencrypt_live_dir="/etc/letsencrypt/live/${PRINCIPAL}"
# generated cert
letsencrypt_issued_cert_file="${letsencrypt_live_dir}/cert.pem"
# generated chain
letsencrypt_issued_chain_file="${letsencrypt_live_dir}/chain.pem"
# generated fullchain
letsencrypt_issued_fullchain_file="${letsencrypt_live_dir}/fullchain.pem"
# generated key
letsencrypt_issued_key_file="${letsencrypt_live_dir}/privkey.pem"
# root CA
root_CA_file="${letsencrypt_zimbra_dir}/TrustIDX3Root.pem"

# zimbra service and binary details
zimbra_service="zimbra"
zimbra_user="zimbra"
zimbra_dir="/opt/zimbra"
zimbra_bin_dir="${zimbra_dir}/bin"
zmcertmgr="${zimbra_bin_dir}/zmcertmgr"
zimbra_ssl_dir="${zimbra_dir}/ssl/zimbra/commercial"
zimbra_key="${zimbra_ssl_dir}/commercial.key"

# subject in request -- does not matter for letsencrypt but must be there for openssl
cert_subject="/"

# openssl config skeleton
#  it is important to have an alt_names section there!
openssl_config="
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req

[req_distinguished_name]
[ v3_req ]

basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = $CN
"
