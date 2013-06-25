# encoding: utf-8

#Created ----- Charoensak 201306191217
require './lib/environment'
require './lib/db/cms'
require './lib/db/oga'
require './lib/db/tmo'
require './lib/db/vaa'

require 'selenium-webdriver'

# Re-arranged and modified manually in order to show non-argument procedure on top. ----- Shumnan 201306191353
# ========== Given ============================================================

Given (/^I have logged in as "(.*?)" user at "(.*?)"$/) do  |user, landingPage|
  # Authorization step ----- Charoensak 201306191217
  # Modify ----- Shumnan 201306191353
  url = "#{Environment.instance.selenium_spec[:base_url]}#{landingPage}"
  $driver.get(url)
  $driver.get(url)
  isCorrectURL = "/http[s]?:\/\/.*\/(#{user}).*/login/".match(url)
  if isCorrectURL == false
    raise "the specified url #{url} is not ACCS urls"
  end
  if $driver.title == 'Login'
    site = user
    authorization = Environment.instance.authorization_spec site

    $driver.find_element(:id, "Login_username").clear
    $driver.find_element(:id, "Login_username").send_keys authorization[:username]
    $driver.find_element(:id, "Login_password").clear
    $driver.find_element(:id, "Login_password").send_keys authorization[:password]
    $driver.find_element(:css, "button.btn.btn-primary").click

    $driver.get url
  end

  def get_textfield(id)
    $logger.info "find element id = #{id} and return its value"
    value = $driver.find_element(:id, id).attribute('value')
    $logger.info "value = #{value}"
    value
  end

  def set_textfield(id, value)
    $logger.info "find element id = #{id}"
    $driver.find_element(:id, id).clear
    $logger.info "send #{value}"
    $driver.find_element(:id, id).send_keys value.to_s
  end

  def get_select(id)
    $logger.info "find element id = #{id} and return its value"
    select_elem = $driver.find_element(:id, id)
    options = select_elem.find_elements(:tag_name, 'option')
    options.each { |option|
      if option.selected?
        value = option.attribute('value')
        $logger.info "value = #{value}, name = #{option.text}"
        return value
      end
    }
  end

  def set_select(id, value)
    $logger.info "find element id = #{id}"
    select = $driver.find_element(:id, id)
    options = select.find_elements(:tag_name, 'option')
    $logger.debug "options.size = #{options.size}"
    options.each { |option|
      $logger.debug "option.attribute('value') = #{option.attribute('value')}"
      if option.attribute('value') == value.to_s or option.text == value.to_s
        $logger.info "click option value = #{option.attribute('value')}, name = #{option.text}"
        option.click
        break
      end
    }
  end

  def get_text_from(tag, data_bind)
    $driver.execute_script("return $('#{tag} [data-bind=\"#{data_bind}\"]').text()")
  end
end

Given(/^I am on "(.*?)" page$/) do  |titleName|
  $driver.getTitle.should "#{titleName}"
end

