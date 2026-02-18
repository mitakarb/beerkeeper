source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

gem "rails", "~> 8.1.2"

gem "bcrypt", "~> 3.1.21"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.3.8"
gem "dartsass-rails", "~> 0.5.1"
gem "importmap-rails"
gem "jbuilder"
gem "sqlite3", "~> 2.9"
gem "propshaft"
gem "puma", "~> 7.2"
gem "falcon"
gem "rails-i18n"
gem "redis", "~> 5.4"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "view_component", "~> 4.4"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
end
