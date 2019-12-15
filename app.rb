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
		sleep(sample_a_number(900, 800))
	end
	sleep(sample_a_number(10000, 2000))
	retry
end

perform
