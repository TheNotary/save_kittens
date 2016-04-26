source 'https://rubygems.org'

gem 'rails', '4.1.12'
gem 'thin'

gem 'figaro'
gem 'devise'
gem 'area'
gem 'gon'
gem 'faye'

gem 'dalli'
gem 'memcachier'

gem 'haml-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'
#gem 'uglifier', '>= 1.3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-jquery-validation'
  gem 'rails-assets-faye'
end


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

group :development, :test do
  gem 'pry'
  gem 'better_errors'
  gem "binding_of_caller"
  #gem 'spring'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

