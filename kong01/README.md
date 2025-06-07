参考URL

# Kongを使う流れ
- 最初にPostgresqlの設定をする
  - 利用するkongユーザ、kongデータベースを作成
- 次に/etc/kong/kong.confでDBの設定を実施
- 最後にkongのサービス起動

# Postgresqlのインストール手順
- pkgのインストールまではスクリプト

### postgresユーザのPWD
su -
password postgres
 ->pwd入力: postgres

### initdb
- initdbはpostgresユーザで実施する
su - postgres
  $HOMEが/var/lib/pgsql
initdb

### リモート接続許可

#### /var/lib/pgsql/data/postgres.confを編集
#listen_addresses = 'localhost'          # what IP address(es) to listen on;
↓
listen_addresses = '*'          # what IP address(es) to listen on;

#### pg_hba.confの編集
```
host    all             all             127.0.0.1/32            trust
##### 以下を追加
host    all             all             0.0.0.0/0       md5
```

### db起動
systemctl start postgres

### kongユーザ、kongデータベース作成
su - postgres

psql -U postgres
=# CREATE USER kong WITH PASSWORD 'kong'; CREATE DATABASE kong OWNER kong;

### Kong Gatewayの移行
- kong.konfの`pg_password = kong`を設定しただけ
  - 下記コマンド実行時は、pg_password設定しなくても正常終了した
root# kong migrations bootstrap -c /etc/kong/kong.conf

ls -l /usr/local/kong/logs

### Start Kong Gateway

root# kong start -c /etc/kong/kong.conf

### Verify Install
Check Admin API
curl -i http://localhost:8001

### Enable Kong Manager
- kong.confをエディット
```
admin_gui_path = /manager
admin_gui_url = http://192.168.56.33:8002/manager
```

kong restart -c /etc/kong/kong.conf

http://192.168.56.33:8002/manager


