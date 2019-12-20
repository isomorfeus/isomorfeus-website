source 'https://rubygems.org'
source "https://rubygems.pkg.github.com/isomorfeus"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'iodine', '~> 0.7.38'
gem 'foreman', require: false

gem 'roda', '~> 3.25.0'

gem 'opal', github: 'janbiedermann/opal', branch: 'es6_modules_1_1'
gem 'opal-activesupport', '~> 0.3.3'
gem 'opal-webpack-loader', '>= 0.9.9'

gem 'isomorfeus-redux', '~> 4.0.16'
gem 'isomorfeus-react', '>= 16.12.4'

source "http://gems.isomorfeus.com" do
  gem 'isomorfeus-policy', '~> 1.0.0.zeta10'
  gem 'isomorfeus-transport', '~> 1.0.0.zeta10'
  gem 'isomorfeus-i18n', '~> 1.0.0.zeta10'
  gem 'isomorfeus-data', '~> 1.0.0.zeta10'
  gem 'isomorfeus-operation', '~> 1.0.0.zeta10'
end

group :test do
  gem 'rspec', '~> 3.8.0'
  gem 'isomorfeus-puppetmaster', '~> 0.3.0'
end
