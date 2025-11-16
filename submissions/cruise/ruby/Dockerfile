FROM ruby:3.2-alpine

WORKDIR /app

# 必要なパッケージをインストール
RUN apk add --no-cache build-base bash

# Gemfileをコピー
COPY Gemfile ./

# 依存関係をインストール
RUN bundle install

# ソースコードをコピー
COPY . .

# デフォルトでbashを起動
CMD ["/bin/bash"]
