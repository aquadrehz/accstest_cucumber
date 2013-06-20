# encoding: utf-8
# Res arranged and modified manually in order to show non-argument procedure on top.     ----- Shumnan 201306191217
require 'selenium-webdriver'

#TODO Implement these step to input in each element.     ----- Shumnan 201306191353

# ========== When ============================================================
When(/^choose the destination$/) do
  # TODO This element is unavailable due to no related page was implemented in web site.
end

When(/^click tab link at "(.*?)" "(.*?)"$/) do |neame|
  hrefValue = "/accs/vaa/www/outbound/index/"   if name == "VAA Outbound"
  hrefValue = "/accs/vaa/www/activity/index/"   if name == "VAA Activity"
  # hrefValue = <targetPath>   if name == <containerName>
  # Place another tab target hear as same as above pattern. Check html element for more detail.
  $driver.find_element(:href, hrefValue).click
end

When(/^fill the "(.*?)" V2V info$/) do |option|
  pending # express the regexp above with the code you wish you had
end

# ========== Then ============================================================
Then(/^V2V is inserted to database$/) do
  # TODO need to broke this step into sub step that check from GUI only
  pending # express the regexp above with the code you wish you had
end

Then(/^display the Warning "(.*?)"$/) do |warning|
  # TODO This item wasn't clearly declared. Need to check the code via manual testing.
end

