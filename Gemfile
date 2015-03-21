source 'https://rubygems.org'

# rails
gem 'rails', '4.1.5'

gem 'dotenv-rails'

# db
gem 'sqlite3'

# front end
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem 'slim-rails'
gem 'bootstrap-sass'

group :development do
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'faker'
end

# for deployment (https://gorails.com/deploy/ubuntu/14.04)
gem 'passenger'
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'

# because were using rbenv on our production server
gem 'capistrano-rbenv', github: "capistrano/rbenv"
