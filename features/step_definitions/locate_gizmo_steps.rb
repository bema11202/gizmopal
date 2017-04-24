require 'selenium-webdriver'
require 'appium_lib'
require 'cucumber'
require 'rspec'
require 'rdoc'
include RSpec::Matchers
include RSpec::Expectations
include Selenium::WebDriver::Support



Given(/^I have successfully pair the gizmo$/) do

  @get_started = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/introNextButton'))}
  @get_started.click

  # I should see the continue button$
  continue_button = wait.until{@driver.find_element(:xpath, '//android.widget.Button[2]')}
  continue_button.click


  # I should see the permission popup buttons
  permission_popup = wait.until{(@driver.find_element(:xpath, '//android.widget.Button[2]'))}
  3.times do
    permission_popup.click
  end


  # I should see the Next button on Prepare your Gizmo page
  prep_your_giz_next = wait.until{(@driver.find_element(:xpath, '//android.widget.Button[1]'))}
  @prep_your_giz_next = prep_your_giz_next

  # I click on the next button on Prepare your Gizmo page
  @prep_your_giz_next.click


  # I should see the gizmo number text field
  gizmo_number_input = wait.until{(@driver.find_element(:class, 'android.widget.EditText'))}
  @gizmo_number = gizmo_number_input

  # I Enter a valid gizmo number and press Next
  gizmo_number = @gizmo_number

  #@gizmo_test_numbers = [6464543333, 2128893345, 9084565555, 7184449000, 9084445555].sample
  @gizmo_test_numbers = 9082395581
  gizmo_number.send_keys(@gizmo_test_numbers)
  click_next_button

  # Check if the phone number exist
  validate_phone_number

  # I enter child’s name and select what the child calls you from the dropdown menu and press the NEXT button

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_name').send_keys 'VC200')}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupColorsSpinner').click)}

  wait.until{(@driver.find_element(:xpath, '//android.widget.LinearLayout[10]').click)}

  click_next_button

  # I should see the skip PIN popup
  click_next_button
  wait.until{(@driver.find_element(:id, 'android:id/button1').click)} #Skip creating a PIN button


  # I should see the security code field

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code'))}


  # I enter the five digits security code and click NEXT
  # Get security code from the device and enter it here
  puts "Enter the security code you received from the text message here:".upcase
  code = gets

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code').send_keys(code))}

  click_next_button

  # I should see text containing Linking To Your Gizmo header
  wait = Selenium::WebDriver::Wait.new :timeout => 240
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader'))})

  #'Linking to Your Gizmo'
  linking_confirmation = @driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader')
  # I should see allow contacts popup
  if
    allow_contact = wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button'))}
    allow_contact.click

  elsif linking_confirmation.text.eq('Unable to Linking to Your Gizmo')
    @driver.quit
    
  end

  contact_exists = wait.until{(@driver.find_element(:id => 'android:id/button1'))}

  contact_exists.click if contact_exists

  2.times do
    click_next_button
    puts 'Gizmo has been successfully paired'.upcase
  end

  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/gizmopal_locate').click)})

end


Then(/^I should be able to locate the gizmo every five minutes upto one hundred times$/) do |counter = 0|

  clicks_counter

  while counter < 100
    sleep 90
    location = @driver.find_element(:id => 'com.vzw.gizmopal:id/gizmopal_locate')
    location.click

  end
end

