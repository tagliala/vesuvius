# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.2'

gem 'sinatra', '~> 2.1'

gem 'rake', '~> 13.0'
gem 'slim', '~> 4.1'
gem 'thin', github: 'macournoyer/thin'

group :development do
  gem 'rubocop', '~> 1.2'
  gem 'rubocop-performance', '~> 1.8'
end
