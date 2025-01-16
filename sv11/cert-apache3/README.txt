https://www.tohoho-web.com/ex/openssl.html

# 認証局の秘密鍵を作成する
# openssl genrsa 4096 > ./my-ca.key

# 認証局の証明書署名要求を作成する
# openssl req -new -key ./my-ca.key > ./my-ca.csr
Organization Name (eg, company) [Default Company Ltd]:My Example CA

# 認証局の証明書を作成する
# cat ./my-ca.csr | openssl x509 -req -signkey ./my-ca.key -days=3650 > ./my-ca.crt

--------
上記で作成したファイルなどを /etc/pki/tls/openssl.cnf の下記設定と合わせて設置していきます。

