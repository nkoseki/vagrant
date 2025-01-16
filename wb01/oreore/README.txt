## PWDなしで秘密鍵
openssl genrsa -out server.key 2048

## CSRの作成
openssl req -new -key server.key -out server.csr

 - CN: myserv.com

## SANsに適用するホスト名を指定する

Chromeは、ドメイン名のチェックをCommon Nameで行わず、SAN（Subject Alternative Name）を参照しているとのこと。
従って、SAN.txtに適用するホスト名を指定する。

cat SAN.txt
subjectAltName = DNS:localhost

## 証明書作成
openssl x509 -req -days 3650 -signkey server.key -in server.csr -out server.crt -extfile SAN.txt
