require "rubygems"
require "selenium-webdriver"
require "appium_lib"
require "rspec"
require "rspec/expectations"
require "cucumber"
require "rdoc"
include RSpec::Matchers
include RSpec::Expectations





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

end

Then(/^I should be able to edit caregiver information$/) do
  pending
end

Then(/^I should be able to convert a caregiver into a contact$/) do
  pending
end

Then(/^I should be able to delete a caregiver$/) do
  pending
end

Then(/^I should not be able to add a contact without a name or phone number$/) do
  pending
end

Then(/^I should be able to add a contact$/) do
  pending
end

Then(/^I should be able to delete a contact$/) do
  pending
end

