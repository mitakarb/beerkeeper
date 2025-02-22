# syntax=docker/dockerfile:1.4
FROM ruby:3.4.1-slim AS base

# 共通の依存関係
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Node.jsのセットアップ（共通）
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# 開発環境用ビルドステージ
FROM base AS builder

WORKDIR /app

# 非rootユーザーの作成（開発環境用）
RUN groupadd -r rails && useradd -r -g rails rails && \
    mkdir -p /app/log /app/tmp/cache /app/tmp/pids /app/tmp/capybara /app/public/assets && \
    chown -R rails:rails /app && \
    chmod -R 777 /app/log /app/tmp /app/public

# 開発用パッケージのインストール
RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    vim \
    chromium \
    chromium-driver \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# ディレクトリの作成と権限設定
RUN mkdir -p /app/app/assets/builds /app/tmp/cache /app/log /app/tmp/pids /app/tmp/capybara /app/public/assets && \
    mkdir -p /home/rails && \
    mkdir -p /usr/local/bundle && \
    chown -R rails:rails /app /home/rails /usr/local/bundle && \
    chmod -R 777 /app /usr/local/bundle

# Node.jsとyarnのセットアップ
RUN npm install -g yarn && \
    yarn config set cache-folder /usr/local/share/.cache/yarn

# Gemfileのコピーと依存関係のインストール（rootとして実行）
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path '/usr/local/bundle' && \
    bundle install --no-cache && \
    bundle config set --local deployment 'true'

# アプリケーションコードのコピー
COPY . .

# ディレクトリとパーミッションの設定
RUN mkdir -p /app/tmp/capybara /app/app/assets/builds /app/public/assets && \
    touch /app/app/assets/builds/application.css && \
    chown -R rails:rails /app && \
    chmod -R 777 /app/tmp /app/log /app/public /app/app/assets /app/public/assets

# package.jsonの作成とnpm依存関係のインストール
RUN echo '{"name":"beerkeeper","private":true,"scripts":{"build:css":"sass ./app/assets/stylesheets/application.scss:./app/assets/builds/application.css --no-source-map --load-path=node_modules"},"dependencies":{"@popperjs/core":"^2.11.8","bootstrap":"^5.3.3","sass":"^1.71.1"}}' > package.json && \
    chown -R rails:rails /app && \
    chmod -R 777 /app && \
    su -c "yarn install" rails

USER rails
WORKDIR /app

# アセットのプリコンパイル
ENV RAILS_ENV=test \
    NODE_ENV=production
RUN yarn build:css && \
    bundle exec rake assets:precompile && \
    bundle exec rake assets:precompile

# アセットのプリコンパイル
RUN bundle exec rake assets:precompile RAILS_ENV=test

# Gemのインストール（キャッシュ利用）
COPY Gemfile Gemfile.lock ./
RUN --mount=type=cache,target=/usr/local/bundle/cache \
    bundle install

# Node.jsの依存関係インストール（存在する場合）
COPY package*.json ./
RUN --mount=type=cache,target=/usr/local/share/.cache/yarn \
    if [ -f package.json ]; then \
    npm install; \
    fi

USER rails

# 本番環境用ステージ
FROM base AS production

WORKDIR /app

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt \
    apt-get update && apt-get install -y \
    postgresql-client \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# 非rootユーザーの作成
RUN groupadd -r rails && useradd -r -g rails rails
RUN chown -R rails:rails /app

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --chown=rails:rails . .

USER rails

ENV RAILS_ENV=production
CMD ["rails", "server", "-b", "0.0.0.0"]
