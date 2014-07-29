source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record

## Database
# gem 'sqlite3'
gem 'pg'

# Authentication
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-dropbox-oauth2'

gem 'jbuilder', '~> 2.0'
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'

# Helpers
gem 'active_decorator'

# Models
gem 'figaro'
gem 'enumerize'
gem 'validates_email_format_of'
gem 'unf'
# gem 'fog'

# Views
gem 'bootstrap-sass'
gem 'compass-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'simple_form'
gem 'kaminari'
gem 'turbolinks'

# Server
gem 'puma'
gem 'rack-rewrite'
gem 'sidekiq'


# Tools
gem 'octokit'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Debugs
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'quiet_assets'
  gem 'tapp'
  gem 'view_source_map'
  gem 'i18n-tasks'
  gem 'thin'
  gem "rails-erd"
#  gem 'html2haml'
end

group :test, :development do
  gem 'brakeman'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-sprockets2'
  gem 'json_expressions'
  gem 'launchy'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false
  gem 'rspec', '~> 3.0'
  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'json_spec'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
