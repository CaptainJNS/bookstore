source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'aasm', '~> 5.0', '>= 5.0.5'
gem 'activeadmin', '~> 2.1'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'cancancan', '~> 3.0', '>= 3.0.1'
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'draper', '~> 3.1'
gem 'ffaker', '~> 2.11'
gem 'haml', '~> 5.1', '>= 5.1.1'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'image_processing', '~> 1.9'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'mini_magick'
gem 'omniauth', '~> 1.9'
gem 'omniauth-facebook', '~> 5.0'
gem 'sass', '~> 3.7', '>= 3.7.4'
gem 'seedbank', '~> 0.5.0'
gem 'simple_form', '~> 5.0', '>= 5.0.1'
gem 'open_uri_redirections', '~> 0.2.1'
gem 'paperclip', '~> 6.1'
gem 'aws-sdk', '~> 3.0', '>= 3.0.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'capybara', '~> 2.13.0'

  gem 'rspec', '~> 3.8'
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'rubocop', '~> 0.74.0'
  gem 'rubocop-rspec', '~> 1.35'
  gem 'letter_opener', '~> 1.7'
end

group :development do
  gem 'fasterer', '~> 0.6.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara-webkit', '~> 1.14.0'

  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 5.0'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  gem 'shoulda-matchers'
  gem 'simplecov', '~> 0.16.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
