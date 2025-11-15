FROM node:20-alpine

WORKDIR /app

# bashをインストール
RUN apk add --no-cache bash

# package.jsonとpackage-lock.jsonをコピー
COPY package.json ./

# 依存関係をインストール
RUN npm install

# ソースコードをコピー
COPY . .

# デフォルトでbashを起動
CMD ["/bin/bash"]
