# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.0.1'

gem 'sinatra', '~> 2.1'

gem 'puma', '~> 5.3'

gem 'rake', '~> 13.0'
gem 'slim', '~> 4.1'

group :development do
  gem 'rubocop', '~> 1.17'
  gem 'rubocop-performance', '~> 1.11'
  gem 'rubocop-rake', '~> 0.5.1'
end
