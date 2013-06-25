# encoding: utf-8
# Res arranged and modified manually in order to show non-argument procedure on top.     ----- Shumnan 201306191217
require 'selenium-webdriver'

# ========== When ============================================================
When(/^choose destination at "(.*?)"$/) do |placeID|

  $driver.find_element(:class, btn-success).click

end