source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.7", ">= 6.1.7.2"
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "action_policy"
gem "actiontext", "~> 6.1.7.2"
gem "devise"
gem "interactor"
gem "turbolinks", "~> 5"

gem "bootsnap", ">= 1.4.4", require: false
gem "enumerize"
gem "pry", "~> 0.13.1"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 6.0.1"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-thread_safety", require: false
end

group :development do
  gem "letter_opener"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
