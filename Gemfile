source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.1"

gem "rails", "~> 8.0.1"

gem "bcrypt", "~> 3.1.20"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.3.3"
gem "dartsass-rails", "~> 0.5.1"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "propshaft"
gem "puma", "~> 6.6"
gem "rails-i18n"
gem "redis", "~> 5.3"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "view_component", "~> 3.21"

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
