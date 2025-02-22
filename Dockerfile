# ビルドステージ
FROM ruby:3.4.1 AS builder

WORKDIR /app

# Node.jsのセットアップ
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && apt-get install -y \
    nodejs \
    git \
    vim \
    chromium \
    chromium-driver

# 依存関係のインストール
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 実行ステージ
FROM ruby:3.4.1-slim

WORKDIR /app

# Node.jsとその他必要なパッケージのインストール
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && apt-get install -y \
    nodejs \
    postgresql-client \
    chromium \
    chromium-driver \
    git \
    && rm -rf /var/lib/apt/lists/*

# ビルドステージから必要なファイルをコピー
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . .

# 実行時の設定
ENV RAILS_ENV=development
CMD ["rails", "server", "-b", "0.0.0.0"]
