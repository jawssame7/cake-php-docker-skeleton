# CakePHP 5.x スケルトン

## CakePHP インストール手順

1. 起動
    ```
    $ docker-compose up -d
    ```
2. コンテナに入る
   ```
   $ docker exec -it app bash
    ```
3. CakePHP 5.x インストール用シェルを実行
    ```
    $ sh docker/install-cake5.sh

   途中、以下のようなメッセージがでるので「Y」を入力
   Set Folder Permissions ? (Default to Y) [Y,n]?
   ```
4. サイトアクセス
    ```
    http://localhost/
   ```

## CakePHP 初期設定手順(ローカル)

1. `config/.env.example`を`config/.env`にリネームして、以下の項目を環境に合わせて修正
    ```js:.env
    export APP_NAME="__APP_NAME__"  <== プロジェクト名
    export DEBUG="true"
    export APP_ENCODING="UTF-8"
    export APP_DEFAULT_LOCALE="en_US"   <== ja_JP
    export APP_DEFAULT_TIMEZONE="UTC"   <== Asia/Tokyo
    export SECURITY_SALT="__SALT__"     <== ランダムな32文字以上
    ```
2. `config/app_local.php`のDB接続部分を修正
3. `config/bootstrap.php`の以下の部分のコメントアウトを解除(68行目あたり)
    ```php
   if (!env('APP_NAME') && file_exists(CONFIG . '.env')) {
     $dotenv = new \josegonzalez\Dotenv\Loader([CONFIG . '.env']);
     $dotenv->parse()
         ->putenv()
         ->toEnv()
         ->toServer();
}
   ```
3. サイトにアクセスして、WelcomeページのDatabaseの欄が「CakePHP is able to connect to the database.」となっていれば接続OK
