source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.4"

gem "rails", github: "rails/rails", branch: "main"

gem "bcrypt", "~> 3.1.20"
gem "bootsnap", require: false
gem "dartsass-rails"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "primer_view_components", "~> 0.27"
gem "propshaft"
gem "puma", "~> 6.4"
gem "rails-i18n"
gem "redis", "~> 5.2"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "view_component", "~> 3.12"

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
