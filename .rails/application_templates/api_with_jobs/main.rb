def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'foreman'
gem 'sidekiq'

gem_group :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'simplecov-console'
  gem 'vcr'
  gem 'webmock'
end

gem_group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

generate 'rspec:install'

file '.rspec', <<-RSPEC
--require spec_helper
RSPEC

