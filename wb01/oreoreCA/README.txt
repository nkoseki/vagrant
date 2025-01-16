https://qiita.com/ll_kuma_ll/items/13c962a6a74874af39c6

=============================================
# オレオレ認証局作成

## オレオレ証明書の秘密鍵
openssl genrsa -aes256 -out /etc/pki/CA/private/cakey.pem 2048
  pwd: koseki

## CSR
openssl req -new -key /etc/pki/CA/private/cakey.pem -out /etc/pki/CA/cacert.csr
  CN: :ore.ca.com

## オレオレ証明書
openssl x509 -days 3650 -in /etc/pki/CA/cacert.csr -req -signkey /etc/pki/CA/private/cakey.pem -out /etc/pki/CA/cacert.pem

=============================================
# オレオレサーバ証明書

## 秘密鍵作成

penssl genrsa -aes256 -out /etc/pki/tls/private/privkey.pem 2048
  pwd: koseki

## CSR作成
openssl req -new -key /etc/pki/tls/private/privkey.pem -out /etc/pki/tls/certs/wb01.local.csr
  rganization Name (eg, company) [ORE CA]:koseki home
  Common Name (eg, your name or your server's hostname) []:wb01.local

## サーバ証明書
openssl ca -in /etc/pki/tls/certs/wb01.local.csr -out /etc/pki/tls/certs/wb01.local.crt.pem -days 825

## Apache用にパスフレーズなしの鍵を作成
openssl rsa -in /etc/pki/tls/private/privkey.pem -out /etc/pki/tls/private/privkey-nopass.pem
 ->pwd: koseki

## ssl.conf
<VirtualHost *:443>
    ServerName domain-name.example.com
    SSLEngine On
    SSLCertificateFile /etc/pki/tls/certs/domain-name.crt.pem
    SSLCertificateKeyFile /etc/pki/tls/private/privkey-nopass.pem
</VirtualHost>
