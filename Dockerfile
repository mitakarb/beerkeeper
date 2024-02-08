FROM ruby:3.2.2

WORKDIR /app

# Using Node.js v20.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Add packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    nodejs \
    vim \
    chromium \
    chromium-driver
