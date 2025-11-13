FROM ruby:3.4.7

WORKDIR /app

# Using Node.js v24.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash -

# Add packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    nodejs \
    vim \
    chromium \
    chromium-driver
