ENV['NODE_PATH'] = File.join(File.expand_path('..', __dir__), 'node_modules')
ENV['RACK_ENV'] = 'production'
require 'bundler/setup'
require 'rspec'
require 'rspec/expectations'
require 'isomorfeus-puppetmaster'
require_relative '../isomorfeus_website_app'

ASSETS_COMPILED ||= `yarn run production_build`

Isomorfeus::Puppetmaster.download_path = File.join(Dir.pwd, 'download_path_tmp')
Isomorfeus::Puppetmaster.driver = :chromium
Isomorfeus::Puppetmaster.server = :puma
Isomorfeus::Puppetmaster.app = IsomorfeusWebsiteApp
Isomorfeus::Puppetmaster.boot_app

RSpec.configure do |config|
  config.include Isomorfeus::Puppetmaster::DSL
end

