# MongoDBのテスト

## localで動かす場合

### インストール

```zsh
brew tap mongodb/brew
```

```zsh
brew install mongodb-community
```

### MongoDBの起動

起動

```zsh
brew services start mongodb-community
```

停止

```zsh
brew services stop mongodb-community
```

### pythonのライブラリのインストール

```zsh
pip install -r requirements.txt
```

### 参考

[MongoDBをMacOSにインストール](https://qiita.com/fztkm/items/827200b1a5efaa28521c)

## Docker上にUbuntuを構築して動かす場合

### ビルド

```zsh
make build
```

### 実行

```zsh
make start
```

### 参考

[Ubuntu 22.04にMongoDB 6.0とfree5GC WebUIをインストールする](https://qiita.com/s5uishida/items/1757953ff0d0adec50ca)

[Install MongoDB Community Edition on Ubuntu](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)

[Ubuntu20.04にpyenvを使ってPython開発環境を構築するまで](https://qiita.com/tMinamiii/items/ee29987939522ef17a8d)
