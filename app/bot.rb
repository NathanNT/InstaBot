def init
  Selenium::WebDriver::Chrome::Service.driver_path="lib/chromedriver"
  s = Watir::Browser.new
  s.goto 'https://www.instagram.com/'
  puts "sucessfully go to #{s.title}"
  s.window.maximize
  if s.html.include?("Inscrivez-vous pour voir les photos et vidéos de vos amis.")
  	connect_to_account
  end
sleep(10)
end



init
