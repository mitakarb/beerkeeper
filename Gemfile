source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

















# Bootstrap
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
# gem "image_processing", "~> 1.2"
# gem "kredis"
# Hotwire"s modest JavaScript framework [https://stimulus.hotwired.dev]
# Hotwire"s SPA-like page accelerator [https://turbo.hotwired.dev]
# Reduces boot times through caching; required in config/boot.rb
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# Use postgresql as the database for Active Record
# Use Redis adapter to run Action Cable in production
# Use Sass to process CSS
# Use the Puma web server [https://github.com/puma/puma]
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bcrypt", "~> 3.1.20"
gem "bootsnap", require: false
gem "bootstrap"
gem "dartsass-rails", "~> 0.5.0"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.5"
gem "propshaft"
gem "puma", "~> 6.4"
gem "rails-i18n"
gem "rails", github: "rails/rails", branch: "main"
gem "redis", "~> 5.1"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "view_component", "~> 3.11"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
end
