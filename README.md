# MacOS用自動環境構築手順

### 1. Apple IDにログインする

### 2. init.shの実行

1. 本リポジトリを `~/` にcloneする
2. sudo chmod 777 mac_setup.sh で権限を変更する
3. 
4. `sh -c ./mac_setup/mac_setup.sh` を実行する
   1. Xcodeがインストールされる
   2. brew bundleで各種アプリ、フォントをインストール
   3. システム環境設定が変更される
   4. chezmoiでdotfilesのリストア
   5. mackupで各種アプリの設定をリストア
   6. fisherのプラグインをインストール
   7. `web dir` を作成する
   8. `web dir` にgitリポジトリをcloneする

### 3. Alfredの環境設定ファイルをDropoxからダウンロードして実行する
