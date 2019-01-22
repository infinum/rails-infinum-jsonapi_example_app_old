source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.6'
gem 'bugsnag'
gem 'figaro'
gem 'pry-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'bundler-audit', require: false
  gem 'letter_opener'
  gem 'mina-infinum', require: false
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'secrets_cli', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
