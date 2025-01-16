https://tex2e.github.io/blog/protocol/certificate-with-ip-addr

openssl genrsa -out server.key
openssl req -new -key server.key -out server.csr -subj "/C=JP/ST=Chiba/L=Chiba City/O=My Org/CN=api.hoge.jp"
cat <<'EOS' > san.txt
subjectAltName = DNS:www.hoge.jp, IP:192.168.56.11
EOS
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt -extfile san.txt
openssl x509 -text -in server.crt -noout
