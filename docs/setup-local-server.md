# Setup Local Server

ローカルサーバを構築する。

## nginx の設定

nginx を設定する。

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

## phpMyAdmin の設定

phpMyAdmin を設定する。

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