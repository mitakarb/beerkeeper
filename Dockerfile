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
    BUNDLE_BIN=/usr/local/bundle/bin \
    PATH=/usr/local/bundle/bin:$PATH \
    BUNDLE_APP_CONFIG=/usr/local/bundle

# Install dependencies as root first
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local path '/usr/local/bundle' && \
    bundle install

# Create app user and set up directories with proper permissions
RUN groupadd -r app && useradd -r -g app -d /home/app -m app && \
    mkdir -p /app/log /app/tmp/{pids,cache,sockets} /app/node_modules /app/public/assets /app/app/assets/builds && \
    mkdir -p /usr/local/bundle/ruby/3.4.0/{cache,gems,specifications,extensions} && \
    chown -R app:app /app /home/app /usr/local/bundle && \
    chmod -R 2775 /usr/local/bundle && \
    chmod -R g+s /usr/local/bundle && \
    find /usr/local/bundle -type d -exec chmod 2775 {} \; && \
    find /usr/local/bundle -type f -exec chmod 664 {} \; && \
    chmod -R 777 /app/tmp

# Switch to app user
USER app
ENV HOME=/home/app

# Copy application files
COPY --chown=app:app . .

# Install Node.js dependencies if package.json exists
RUN if [ -f package.json ]; then yarn install; fi

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
