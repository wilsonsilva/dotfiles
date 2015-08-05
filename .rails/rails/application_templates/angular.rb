def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

gem 'haml'
gem 'foreman'
gem 'bower-rails'
gem 'angular-rails-templates'

gem_group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'phantomjs'
  gem 'poltergeist'
  gem 'teaspoon'
  #gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'webmock'
  gem 'fakeweb'
  gem 'vcr'
  gem 'timecop'
end

gem_group :development, :test do
  gem 'pry-rails'
end

generate 'rspec:install'

file '.rspec', <<-CODE
--color --format progress
CODE

