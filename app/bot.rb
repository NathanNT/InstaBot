def sample_a_number(number, incertitude)
return rand(number-incertitude..number+incertitude)
end


def init
  Selenium::WebDriver::Chrome::Service.driver_path="lib/chromedriver"
  s = Watir::Browser.new
  return s
end

def connect 
  s = init
  s.goto 'https://www.instagram.com/accounts/login/?source=auth_switcher'
  puts "sucessfully go to #{s.title}"
  #s.window.maximize
  sleep(3)
  login = s.text_field :name => 'username'
  login.set ENV['INSTA_LOGIN']
  sleep(1)
  password = s.text_field :name => 'password'
  password.set ENV['INSTA_PASS']
  sleep(5)
  s.button(:type => 'submit').click
  puts "sucessfully connected"
  sleep(5)
  s.button(:text => 'Plus tard').click
  sleep(5)
  s.link(:xpath => '//*[@id="react-root"]/section/nav/div[2]/div/div/div[3]/div/div[2]/a').click
  sleep(5)
  target = []
  s.element(:xpath => "/html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div[2]/div/div/div[4]/div/div/div").divs(:class => ['PUHRj',  'H_sJK']).each do |div|
    if div.html.include?('a commencé à vous suivre')
      target << div.a.href
    end
  end
  sleep(sample_a_number(5, 3))
   rescue Exception => ex
  puts "An error of type #{ex.class} happened, message is #{ex.message}"
  return target, s
end

def follow_target(target_url, s)  
  s.goto target_url
  sleep(sample_a_number(5, 3))
  unless s.html.include?("Ce compte est privé")
    s.link(:class => "-nal3").click
    puts "sucessfully connected to #{target_url}"
    sleep(sample_a_number(5, 3))
    1600.times do |i|
      sleep(0.00001)
      a = i.to_f*0.060.to_f
      s.driver.execute_script("console.log(#{a})")
      s.driver.execute_script("document.querySelector('.isgrP').scrollBy(0,#{a})")
    end
    sleep(10)
  end

  s.element(:xpath => "/html/body/div[4]/div/div[2]/ul/div").elements(:class => 'wo9IH').to_a.sample(sample_a_number(10, 5)).each do |li|
    if li.html.to_s.include?("abonner")
     li.button(:type => 'button').click
     puts "Follow #{li.element(:class => "d7ByH").text}"
     sleep(sample_a_number(500, 400))
   end
   sleep(sample_a_number(20, 10))
 end
 rescue Exception => ex
  puts "An error of type #{ex.class} happened, message is #{ex.message}"
 sleep(10)
 return s
end




