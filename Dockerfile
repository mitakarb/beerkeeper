# syntax=docker/dockerfile:1.4
FROM ruby:3.4.1

WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y curl git build-essential libpq-dev vim chromium chromium-driver && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

# Set up environment
ENV BUNDLE_PATH=/usr/local/bundle \
    PATH=/usr/local/bundle/bin:$PATH

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path '/usr/local/bundle' && \
    bundle install

# Create app user and set up directories
RUN useradd -m -s /bin/bash app && \
    mkdir -p /app/tmp /app/log /app/tmp/pids /app/tmp/cache /app/tmp/sockets && \
    chown -R app:app /app /usr/local/bundle && \
    chmod -R 777 /app/tmp && \
    find /usr/local/bundle -type d -exec chmod 755 {} \; && \
    find /usr/local/bundle -type f -exec chmod 644 {} \; && \
    find /usr/local/bundle -type f -name "dart" -exec chmod 755 {} \; && \
    find /usr/local/bundle -type f -name "sass" -exec chmod 755 {} \;

USER app
ENV HOME=/home/app

COPY --chown=app:app . .

# Install Node.js dependencies
RUN if [ -f package.json ]; then yarn install; fi

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
