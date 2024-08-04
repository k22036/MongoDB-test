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
