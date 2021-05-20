# Setup Local Server

ローカルサーバを構築する。

## ウェブサーバの設定

[nginx](https://nginx.org/) を設定する。

以下、 nginx の設定ファイルを設置するディレクトリを `$NGINX_ROOT` とする。  
( macOS の場合 `/usr/local/etc/nginx` )

### 構成ファイルの設置

nginx の動作に必要な `.conf` ファイルを設置する。

`nginx.conf` を設置する。

- `~/.dotfiles/etc/nginx/nginx.conf` を `$NGINX_ROOT/nginx.conf` として複製する。
- macOS で動作しない場合、 `events` の `use` をコメントアウトする。

設定していない `server_name` でアクセスされた場合の設定ファイルを設置する。

- `~/.dotfiles/etc/nginx/http.conf` を `$NGINX_ROOT/servers/http.conf` として複製する。
- `~/.dotfiles/etc/nginx/https.conf` を `$NGINX_ROOT/servers/https.conf` として複製する。

### SSL の設定

SSL使用時に `ssl_dhparam` に指定するファイル `dhparam.pem` を生成する。  
`$NGINX_ROOT/ssl` に移動し、以下コマンドを実行する。

```
$ sudo openssl dhparam 2048 -out dhparam.pem
```

設定していない `server_name` でアクセスされた場合に使用する自己証明書を生成する。  
`$NGINX_ROOT/ssl` に移動し、以下コマンドを実行する。

```
$ sudo openssl genrsa -out nginx.key 2048
$ sudo openssl req -new -key nginx.key -out nginx.csr
$ sudo openssl x509 -days 3650 -req -signkey nginx.key -in nginx.csr -out nginx.crt
```

SSLの認証局をローカル環境に作成するため、以下コマンドを実行する。

```
$ sudo mkcert --install
```

### サーバの追加

アクセス可能なサーバを追加する。  
追加するサーバを `test.example.com` とする。

SSL証明書を生成する。。  
`$NGINX_ROOT/ssl` に移動し、以下コマンドを実行する。

```
$ sudo mkcert test.example.com
```

`~/.dotfiles/etc/nginx/example.conf` を `$NGINX_ROOT/servers/test.example.com.conf` として複製する。

- `server_name` に `test.example.com` を設定する。( 2箇所 )
- `ssl_certificate` と `ssl_certificate_key` に生成したSSL証明書を設定する。
- `root` にドキュメントルートのパスを設定する。

## データベースの設定

[MariaDB](https://mariadb.org/) を設定する。

### MariaDB の初期設定

MariaDB を起動する。  
起動後、セキュリティ向上のため、以下コマンドを実行し初期設定を行う。

```
$ sudo mysql_secure_installation
```

各処理を実行するかどうか訊ねられるので、入力する。

- `Enter current password for root`
  - 初期設定時は root パスワードが設定されていないので入力しない。
- `Switch to unix_socket authentication`
  - 既に設定されている場合は n を入力する。
- `Change the root password`
  - root のパスワードを設定するので y を入力する。
  - パスワードは任意のものを入力する。
- `Remove anonymous users`
  - 匿名ユーザは不要なので y を入力し削除する。
- `Disallow root login remotely`
  - リモートからの root ログインを無効化するので y を入力する。
- `Remove test database and access to it`
  - テストデータベースを削除するので y を入力する。
- `Reload privilege tables now`
  - 権限テーブルを再読み込みするため y を入力する。

### phpMyAdmin の設定

データベースをブラウザから確認できるよう phpMyAdmin を設定する。

以下サイトから phpMyAdmin をダウンロードし、設定したローカルサーバのドキュメントルートに展開する。  
https://www.phpmyadmin.net/

phpMyAdmin のファイル内にある `config.sample.inc.php` を `config.inc.php` として複製する。  
ファイル内の `$cfg['blowfish_secret']` に任意の文字列を代入する。

```php
$cfg['blowfish_secret'] = '';
```

phpMyAdmin のファイル内にある `sql/create_tables.sql` を実行する。

```
$ mysql < create_tables.sql
```