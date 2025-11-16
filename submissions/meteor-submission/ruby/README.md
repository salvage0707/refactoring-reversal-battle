# Ruby FizzBuzz ベースコード

逆リファクタリングバトル用のRuby FizzBuzzベースコードです。

## セットアップ

このディレクトリをコピーして使用してください。

### Dockerを使用する場合（推奨）

1. Dockerイメージをビルド
```bash
docker-compose build
```

2. コンテナを起動してbashに入る
```bash
docker-compose run --rm ruby
```

または、バックグラウンドで起動してから接続する場合：
```bash
docker-compose up -d
docker-compose exec ruby /bin/bash
```

3. コンテナ内でテストを実行
```bash
bundle exec rake test
```

または
```bash
ruby src/fizz_buzz_test.rb
```

4. Rubocopでフォーマット・リンター実行
```bash
bundle exec rubocop -a  # 自動修正
bundle exec rubocop      # チェックのみ
```

### ローカルで実行する場合

1. 依存関係をインストール
```bash
bundle install
```

2. テストを実行
```bash
bundle exec rake test
```

または
```bash
ruby src/fizz_buzz_test.rb
```

## ファイル構成

```
ruby/
├── Dockerfile              # Dockerイメージ定義
├── docker-compose.yml      # Docker Compose設定
├── Gemfile                 # Ruby依存関係
├── Rakefile                # Rakeタスク定義
├── .rubocop.yml            # Rubocop設定
└── src/
    ├── fizz_buzz.rb        # FizzBuzz実装（ここを編集）
    └── fizz_buzz_test.rb  # テストコード
```

## 実装要件

- `fizz_buzz(n)` 関数を実装してください
- テストがすべて通ることを確認してください
- 関数名・引数・戻り値の型は変更しないでください
- Rubocopでフォーマット適用後も動作することを確認してください

## 逆リファクタリングのヒント

- 過剰な抽象化（無駄なクラス階層、無意味なインターフェイス）
- 状態の謎の持ち回り（グローバル依存、余計なオブジェクト生成）
- 追跡困難な制御フロー（例外利用、ネスト過多、無駄な非同期化）
- メタプログラミング乱用（eval、method_missingなど）

ただし、ミニファイ行為やテストコードの改変は禁止です。
