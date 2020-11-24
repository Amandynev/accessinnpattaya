source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'money-rails', '~> 1.13.3'
gem 'stripe', '~> 5.28.0'
gem 'stripe_event', '~> 2.3.1'
gem 'sidekiq', '~> 6.1.2'
gem 'sidekiq-failures', '~> 1.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'mail_form', '~> 1.5', '>= 1.5.1'
gem 'globalize', '~> 5.3.0'
gem 'devise', '~> 4.7.3'
gem 'autoprefixer-rails', '~> 10.0.1.0'
gem 'font-awesome-sass', '~> 5.13.0'
gem 'simple_form', '~> 5.0.3'
gem 'geocoder', '~> 1.6.4'
gem 'postmark-rails'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.14.0'
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'shoulda-matchers', '~> 4.4.1'
  gem 'webmock', '~> 3.9.2'
  gem 'postmark-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~> 6.1.0'
  gem 'rack-mini-profiler', '~> 2.2.0'
  gem 'letter_opener', '~> 1.7.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '~> 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
