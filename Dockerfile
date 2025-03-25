FROM ruby:3.4.1

WORKDIR /app

# Using Node.js v20.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Add packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    nodejs \
    vim

# Install Playwright dependencies
RUN npx playwright install --with-deps
