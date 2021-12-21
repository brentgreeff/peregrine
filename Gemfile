source "http://rubygems.org"
ruby "2.7.2"

gem "roda"
gem "puma"

gem "sparql-client"

group :development do
  gem "rerun"
  gem 'rubocop', require: false
  gem 'flog', require: false
end

group :test do
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'rspec'
  gem 'guard-rspec', require: false
  gem 'rack-test'
  gem 'rspec-benchmark'
  gem 'pry'
  gem 'pry-doc'
  gem 'amazing_print'
  gem 'warning'
end
