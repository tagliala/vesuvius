# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.2.2'

gem 'sinatra', '~> 4.1'

gem 'puma', '~> 6.4'

gem 'rake', '~> 13.0'
gem 'slim', '~> 5.1'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rake'
end
