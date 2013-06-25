# encoding: utf-8
# Res arranged and modified manually in order to show non-argument procedure on top.     ----- Shumnan 201306191217
require 'selenium-webdriver'

# ========== When ============================================================
When(/^choose destination at "(.*?)"$/) do |placeID|
  # TODO This element is unavailable due to no related page was implemented in web site.
  $driver.find_element(:id, "CompanyProfile_tax_incentives_id_of_factory").click
  $driver.find_element(:value, "#{placeID}").click
end

When(/^click "(.*?)" button$/) do |buttonName|
  pending # express the regexp above with the code you wish you had
end

When(/^click tab link at "(.*?)"$/) do |targetLink|
  # Initialize target link and click subsequently     ----- Shumnan 201306211155
  if targetLink == "VAA Outbound"
    landing01 = "dropdown-toggle"
    landing02 = "/accs/vaa/www/outbound/index/"
  elsif targetLink == "VAA Activity"
    landing01 = "dropdown-toggle" 
    landing02 = "/accs/vaa/www/activity/index/"
  else
    raise "The landing link #{landing01} or #{landing02} wasn't found."
    errorOccure = true
  end
  if error != true
    $driver.find_element(:class, landing01).click
    $driver.find_element(:href, landing02).click
  end
end

When(/^fill "(.*?)" V2V info:$/) do |options, info|
  info.inspect
#  table.inspect
#  # TODO Need to get value in the parsed table.
#  table.new(V2V_info_Table.hashes)# Note sure this's correct
#  
#  table.hashed.each do |row|# Note sure this's correct
#    V2V.create :shipmentType => row['Shipment Type'],
#    :declarationNo => row['Declaration No']
#  end
  
  # TODO Below line need to identify value of </option> directly ("สินค้าระบุทำกิจกรรม")     ----- Shumnan 201306211155
  $driver.find_element(:id, "VAAInbound_activity").click
  $driver.find_element(:value, "1").click 
  $driver.find_element(:id, "VAAInbound_declaration_no").send_keys "#{option.declarationNo}"
end

# ========== Then ============================================================
Then(/^VAA Table display "(.*?)" V2V info:$/)do |options, info|
  # TODO need to get array parameter to search result in VAA table.     ----- Shumnan 201306211155
  $driver.find_element(:id,"")
end

Then(/^display Warning "(.*?)"$/) do |warning|
  # TODO ไม่พบรายการที่ค้นหา is value of </div> tag so we need more indenticator to locate tag value.     ----- Shumnan 201306211155
  # <div class="falert" data-bind="html: falert">
  # ไม่พบรายการที่ค้นหา
  # </div>
  $driver.find_element(:class, faleart).should "ไม่พบรายการที่ค้นหา"
end

