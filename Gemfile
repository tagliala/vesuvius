# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'sinatra', '~> 2.0'

gem 'rake', '~> 12.0'
gem 'slim', '~> 3.0'
gem 'thin', '~> 1.7'
