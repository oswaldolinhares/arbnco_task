# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "active_storage_validations"
gem "aws-sdk-s3"
gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "rails-i18n", "~> 7.0.0"
gem "redis"
gem "sidekiq"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "amazing_print"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 6.0.0"
  gem "rubocop"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "vcr"
  gem "webmock"
end

group :development do
  gem "guard-rspec", require: false
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "database_cleaner-active_record"
  gem "rspec-sidekiq"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "simplecov-console", require: false
  gem "simplecov-json", require: false
  gem "simplecov-lcov", require: false
  gem "webdrivers"
end
