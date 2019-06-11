source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'puma', '~> 3.12.1', require: false
gem 'foreman', require: false

gem 'roda', '~> 3.19.0'

gem 'opal', github: 'janbiedermann/opal', branch: 'es6_modules_1_1'
gem 'opal-activesupport', github: 'janbiedermann/opal-activesupport', branch: 'relax'
gem 'opal-webpack-loader', '>= 0.9.1'

gem 'opal-autoloader', '~> 0.0.3'
gem 'isomorfeus-redux', '~> 4.0.7'
gem 'isomorfeus-speednode', '~> 0.2.7'
gem 'isomorfeus-react', '~> 16.8.3'

#
#
#gem 'isomorfeus-policy', '~> 1.0.0.delta5'
#gem 'isomorfeus-operation', '~> 1.0.0.delta5'
#gem 'isomorfeus-i18n', '~> 1.0.0.delta5'

group :development do
  gem 'auto_reloader'
end

group :test do
  gem 'rspec', '~> 3.6.0'
  gem 'isomorfeus-puppetmaster', '~> 0.2.7'
end
