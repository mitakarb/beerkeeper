FROM ruby:3.2.0

WORKDIR /app

# Using Node.js v18.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

# Add packages
RUN apt update && apt install -y \
    git \
    nodejs \
    vim

# Add Chrome
RUN curl -sO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb

# Add chromedriver
RUN CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` \
    && curl -sO https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && mv chromedriver /usr/bin/chromedriver
