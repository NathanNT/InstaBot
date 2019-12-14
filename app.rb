require 'bundler'
Bundler.require

Dotenv.load('.env')

require_relative 'app/bot.rb'
