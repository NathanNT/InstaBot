require 'bundler'
Bundler.require

Dotenv.load('.env')

require_relative 'app/bot.rb'
require_relative 'app/google_init.rb'

def perform
	recup_session_and_targets = connect
	session = recup_session_and_targets[1]
	targets = recup_session_and_targets[0]
	targets.each do |target|
		follow_target(target, session)
	end
end

perform
