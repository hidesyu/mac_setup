#!/bin/sh

##################################
##################################
# MacOS用自動環境構築のためのスクリプト
##################################
##################################



##################################
# gitのデフォルトブランチ名をmainに変更
##################################
git config --global init.defaultBranch Main


##################################
# Xcodeをインストール
##################################
xcode-select --install


##################################
# Homebrewをまずはインストール
##################################
# if [ ! -x "`which brew`" ]; then
  echo "brewのインストールを開始"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew upgrade
  brew -v
	echo "brewのインストール完了"

	echo "brew bundleを実行開始"
	brew bundle --file ~/Brewfile

	# VSCodeの拡張機能インストール
  # if [ -x "`which code`" ]; then
    echo 'Setup VSCode'
    code --install-extension Shan.code-settings-sync -force
    echo "VSCodeの同期完了"
  # fi
# fi


##################################
# システム環境設定の変更開始
##################################
echo 'システム環境設定の変更開始'

# ~/Library ディレクトリを見えるようにする
chflags nohidden ~/Library

# /Volumes ディレクトリを見えるようにする
sudo chflags nohidden /Volumes

# 時計アイコンクリック時に OS やホスト名 IP を表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# ダイアログ表示やウィンドウリサイズ速度を高速化する
defaults write -g NSWindowResizeTime 0.1

# 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# クラッシュレポートを無効化する
defaults write com.apple.CrashReporter DialogType -string "none"

# USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# スペルの訂正を無効にする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Bluetoothヘッドフォン/ヘッドセットの音質を向上させる
$ defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# マウスの速度を速める
defaults write -g com.apple.mouse.scaling 8

echo 'システム環境設定が完了'

#################################################
# Finder環境設定を開始
#################################################
echo 'Finder環境設定を開始'

# Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# フォルダを開くときのアニメーションを無効にする
defaults write com.apple.finder AnimateWindowZoom -bool false

# 不可視ファイルを表示する
defaults write com.apple.finder AppleShowAllFiles YES

# クイックルックでテキストを選択可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true

# Finder を終了させる項目を追加する
defaults write com.apple.Finder QuitMenuItem -bool true

# パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true

# タブバーを表示する
defaults write com.apple.finder ShowTabView -bool true

# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# アドレスバーに完全な URL を表示する
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"

# 上記設定後は、Finderを再起動する
killall Finder

echo 'Finder環境設定を完了'


#################################################
# Dockの環境設定を開始
#################################################
echo 'Dockの環境設定を開始'

# 開いているアプリケーションのみをdockに表示
$ defaults write com.apple.dock static-only -bool true

# Dockを隠す
defaults write com.apple.dock autohide -bool true

# すべての（デフォルトの）アプリアイコンをDockから消去する
$ defaults write com.apple.dock persistent-apps -array

# Dockで開いているアプリケーションのインジケータライトを表示する
$ defaults write com.apple.dock show-process-indicators -bool true

# ディレクトリのスプリングロードを有効化
$ defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# スプリングロード遅延を除去
$ defaults write NSGlobalDomain com.apple.springing.delay -float 0

# ボリュームマウント時に自動的にFinderを表示
$ defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
$ defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
$ defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# 上記設定後は、Dockを再起動する
killall Dock

echo 'Dockの環境設定を完了'


#################################################
# AppStoreの環境設定を開始
#################################################
echo 'AppStoreの環境設定を開始'

# WebKitデベロッパーツールを有効にする
$ defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# デバッグメニューを有効にする
$ defaults write com.apple.appstore ShowDebugMenu -bool true

# 自動更新チェックを有効にする
$ defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# 毎日アプリケーションのアップデートを確認する
$ defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# アプリケーションのアップデートをバックグラウンドでダウンロードする
$ defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# システムデータファイルとセキュリティ更新プログラムをインストールする
$ defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# 他のMacで購入したアプリを自動的にダウンロードする
$ defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# アプリケーションの自動更新を有効化
$ defaults write com.apple.commerce AutoUpdate -bool true

# 再起動が必要なアプリケーションの場合自動で再起動を有効化する
$ defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

echo 'AppStoreの環境設定が完了'


#################################################
# chezmoiをリストアしてdotfileの同期開始
#################################################
echo 'chezmoiをリストアしてdotfileの同期開始'

chezmoi init git@github.com:hidesyu/chezmoi.git

# eval $(op my.1password.com メールアドレス)

chezmoi update
chezmoi apply -v

echo 'chezmoiをリストアしてdotfileの同期完了'

#################################################
# Mackupをリストアして各種アプリの設定を同期開始
#################################################
echo 'Mackupをリストアして各種アプリの設定を同期開始'

mackup restore --force
mackup uninstall

echo 'Mackupをリストアして各種アプリの設定を同期完了'


#################################################
# fishのプラグイン関連をインストール開始
#################################################
echo 'fishのプラグイン関連をインストール開始'

fisher update

echo 'fishのプラグイン関連のインストール完了'

#################################################
# 必要なGitリポジトリをcloneしていく
#################################################
echo '必要なGitリポジトリをcloneしていく'

mkdir ~/Web

git clone https://github.com/hidesyu/masa.git ~/Web/

echo '必要なGitリポジトリのclone完了'




echo 'mac_setup.shの実行が完了しました。'

echo 'Alfredの環境設定ファイルをDropoxからダウンロードして実行しましょう'
