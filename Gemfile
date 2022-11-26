# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.1.3'

gem 'sinatra', '~> 3.0'

gem 'puma', '~> 6.0'

gem 'rake', '~> 13.0'
gem 'slim', '~> 4.1'

group :development do
  gem 'rubocop', '~> 1.39'
  gem 'rubocop-performance', '~> 1.15'
  gem 'rubocop-rake', '~> 0.6.0'
end
