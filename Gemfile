source 'https://rubygems.org'
# source "https://rubygems.pkg.github.com/isomorfeus"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'iodine', '~> 0.7.38'
gem 'foreman', require: false

gem 'roda', '~> 3.29.0'

gem 'opal', github: 'janbiedermann/opal', branch: 'es6_modules_1_1'

gem 'isomorfeus', '~> 1.0.0.zeta25'
gem 'dbm'

group :development do
  gem 'pry', '~> 0.12.2'
  gem 'pry-nav'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'rspec', '~> 3.8.0'
  gem 'isomorfeus-puppetmaster', '~> 0.3.4'
end
