require 'selenium-webdriver'
require 'appium_lib'
require 'cucumber'
require 'rspec'
require 'rdoc'
include RSpec::Matchers
include RSpec::Expectations
include Selenium::WebDriver::Support


Given(/^I have successfully paired the gizmo$/) do
  pair_gizmo
end

Then(/^I should not be able to add a caregiver without a name or phone number$/) do
  settings = wait.until{@driver.find_element(:xpath => '/android.widget.TextView[3]')}
  settings.click

  contacts = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/settingsContactsLayout')}
  contacts.click


  add_contact_button = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add')}
  if add_contact_button.displayed?.to be_truthy
  then add_contact_button.click
  else
    puts 'You have reached the maximum number of contacts'
    @driver.quit
  end

  # Phone number is a required fields

  contact_mdn = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add_mdn')}
  contact_mdn.nil?
  contact_name = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add_name')}
  contact_name.send_keys 'John'
  contact_relationship = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add_relation_edittext')}
  relalationship = ['Uncle', 'Dad', 'Daddy', 'Mom', 'Mommy', 'Friend', 'Coach'].sample
  contact_relationship.send_keys relalationship
  caregiver_check_box = wait.until{@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add_name')}
  caregiver_check_box.click if caregiver_check_box.attribute('checked').nil?

  click_save_button

  expect(@driver.find_element(:id => 'com.vzw.gizmopal:id/contacts_add_mdn_error').text.to eql? 'The phone number must be 10 digits long')

  # Phone number is a required fields ends

end

Then(/^I should be able to add a caregiver$/) do
  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  wait.until{@driver.find_element(:id => 'addcontact_button').click}
  caregiver_info = wait.until{@driver.find_element(:id => 'name')}
  caregiver_info.send_keys 'caregivername'
  caregiver_phone = @driver.find_element(:id => 'caregiverphone')
  caregiver_phone.send_keys 'phone'
  @driver.find_element(:id => 'relationship').click
  wait.until{@driver.find_element(:id => 'relationship_selection').click}

  consent_dropdown =   wait.until{@driver.find_element(:id => 'consent')}
  if consent_dropdown.selected?
    save_button = wait.until{@driver.find_element(:id => 'save')}
    save_button.click
  else
    consent_dropdown.select.action_perform
    save_button.click
  end
  expect(wait.until{@driver.find_element(:id => 'contact_name').text.to include('john')})
  puts 'Contact added successfully'.upcase
end


Then(/^I should be able to edit caregiver information$/) do
  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  contact_name = wait.until{@driver.find_element(:id => 'contact_name')}
  contact_name.clear
  contact_name.send_keys 'Andrew'
  save_button = wait.until{@driver.find_element(:id => 'save')}
  save_button.click

  expect(wait.until{@driver.find_element(:id => 'contact_name').text.to include('Andrew')})
  puts 'Contact edited successfully'.upcase
  end


Then(/^I should be able to convert a caregiver into a contact$/) do
  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  consent_dropdown =   wait.until{@driver.find_element(:id => 'consent')}
  consent_dropdown.click if consent_dropdown.selected?.be_falsey
  save_button = wait.until{@driver.find_element(:id => 'save')}
  save_button.click
  sleep 5
end


  Then(/^I should be able to convert a caregiver into a contact back to a caregiver$/) do

    wait.until{@driver.find_element(:id => 'settins').click}
    wait.until{@driver.find_element(:id => 'contact').click}
    consent_dropdown =   wait.until{@driver.find_element(:id => 'consent')}
    consent_dropdown.click if consent_dropdown.selected?.be_truthy
    save_button = wait.until{@driver.find_element(:id => 'save')}
    save_button.click
    sleep 5
  end

Then(/^I should be able to delete a caregiver$/) do
  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  contact_name = wait.until{@driver.find_element(:id => 'contact_name')}
  contact_name.longpress
  wait.until{@driver.find_element(:id => 'popuponfirm').click}
end

Then(/^I should be able to add a contact$/) do

end

Then(/^I should be able to delete a contact$/) do
  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  contact_name = wait.until{@driver.find_element(:id => 'contact_name')}
  contact_name.longpress
  wait.until{@driver.find_element(:id => 'popuponfirm').click}

end
