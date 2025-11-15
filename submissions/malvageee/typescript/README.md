# TypeScript FizzBuzz ベースコード

逆リファクタリングバトル用のTypeScript FizzBuzzベースコードです。

## セットアップ

このディレクトリをコピーして使用してください。

### Dockerを使用する場合（推奨）

1. Dockerイメージをビルド
```bash
docker-compose build
```

2. コンテナを起動してbashに入る
```bash
docker-compose run --rm typescript
```

または、バックグラウンドで起動してから接続する場合：
```bash
docker-compose up -d
docker-compose exec typescript /bin/bash
```

3. コンテナ内でテストを実行
```bash
npm test
```

4. その他のコマンド
```bash
npm run test:watch  # ウォッチモードでテスト実行
npm run format      # Biomeでフォーマット
npm run lint        # Biomeでリンター実行
npm run check       # Biomeでフォーマットとリンターを実行
```

### ローカルで実行する場合

1. 依存関係をインストール
```bash
npm install
```

2. テストを実行
```bash
npm test
```

## ファイル構成

```
typescript/
├── Dockerfile              # Dockerイメージ定義
├── docker-compose.yml      # Docker Compose設定
├── package.json            # npm依存関係
├── tsconfig.json           # TypeScript設定
├── biome.json              # Biomeフォーマッタ・リンター設定
├── vitest.config.ts        # Vitest設定
└── src/
    ├── fizzBuzz.ts         # FizzBuzz実装（ここを編集）
    └── fizzBuzz.test.ts    # テストコード
```

## 実装要件

- `fizzBuzz(n: number): string` 関数を実装してください
- テストがすべて通ることを確認してください
- 関数名・引数・戻り値の型は変更しないでください
- Biomeでフォーマット適用後も動作することを確認してください

## 逆リファクタリングのヒント

- 過剰な抽象化（無駄なクラス階層、無意味なインターフェイス）
- 状態の謎の持ち回り（グローバル依存、余計なオブジェクト生成）
- 追跡困難な制御フロー（例外利用、ネスト過多、無駄な非同期化）
- メタプログラミング乱用（eval、Proxyなど）

ただし、ミニファイ行為やテストコードの改変は禁止です。
