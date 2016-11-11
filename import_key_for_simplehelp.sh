#!/bin/bash

server_name="servername.com"
mypass="temppass"
shlocation="/opt/SimpleHelp"

wget https://letsencrypt.org/certs/isrgrootx1.pem -O $shlocation/isrgrootx1.pem
wget https://letsencrypt.org/certs/letsencryptauthorityx3.pem -O $shlocation/letsencryptauthorityx3.pem
cat $shlocation/isrgrootx1.pem $shlocation/letsencryptauthorityx3.pem >>$shlocation/lechain.pem

openssl pkcs12 -export -in /etc/letsencrypt/live/$server_name/cert.pem \
  -inkey /etc/letsencrypt/live/$server_name/privkey.pem \
  -out $shlocation/configuration/sslconfig/store.p12 \
  -name simplehelp \
  -CAfile $shlocation/lechain.pem \
  -caname root -chain \
  -passout pass:$mypass

$shlocation/jre/bin/keytool -importkeystore \
  -srckeystore $shlocation/configuration/sslconfig/store.p12 \
  -srcstoretype pkcs12 \
  -destkeystore $shlocation/configuration/sslconfig/keystore \
  -deststoretype JKS \
  -deststorepass $mypass \
  -noprompt \
  -srcstorepass $mypass 
