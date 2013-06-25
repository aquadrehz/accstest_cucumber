# Initial Selenium web driver and else. ----- Shumnan 201306191217
# This step invoked by Selenium. Most singleton need to initialize here at Befire.

require 'selenium-webdriver'
  
Before do 
  $driver = Selenium::WebDriver.for Environment.instance.selenium_spec[:driver]
  if $driver.nil?
    raise "cannot load selenium-webdriver for #{Environment.instance.selenium_spec[:driver]}"
  end
  $logger = Environment.instance.logger
  $logger.info "selenium start #{Environment.instance.selenium_spec[:driver]}"
end

After do
  $logger.info "selenium quit #{Environment.instance.selenium_spec[:driver]}"
  $driver.quit
end