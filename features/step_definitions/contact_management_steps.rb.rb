require 'selenium-webdriver'
require 'appium_lib'
require 'cucumber'
require 'rspec'
require 'rdoc'
require 'watir'
include RSpec::Matchers
include RSpec::Expectations
include RSpec::Core::DSL
include Selenium::WebDriver::Support
include Selenium::WebDriver::DriverExtensions
include Selenium::WebDriver::KeyActions
include Selenium::WebDriver::Keys
include Selenium::WebDriver::SearchContext
include Appium::Android
include Selenium::WebDriver::Interactions


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
  @gizmo_test_numbers = 9088098036
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

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code')).text.be_truthy}

  next_button = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
  sleep 7
  next_button.displayed?
  next_button.click



  # I should see text containing Linking To Your Gizmo header
  wait = Selenium::WebDriver::Wait.new :timeout => 240
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader'))})

  #'Linking to Your Gizmo'
  linking_confirmation = @driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader')
  # I should see allow contacts popup
  if
  allow_contact = wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button'))}
    allow_contact.click
    expect { print 'Gizmo successfully paired' }.to output('Gizmo successfully paired').to_stdout

  elsif linking_confirmation.text.eq('Unable to Linking to Your Gizmo')
    @driver.quit
  end

  contact_exists = wait.until{(@driver.find_element(:id => 'android:id/button1'))}

  contact_exists.click if contact_exists

  2.times do
    click_next_button

    puts 'Gizmo has been successfully paired'.upcase

  end
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
    consent_dropdown.click
    click_save_button

  else

    click_save_button
  end
  expect(wait.until{@driver.find_element(:id => 'contact_name').text.to include('john')})
  puts 'Contact added successfully'.upcase
end

Then(/^I should be able to delete a contact$/) do

  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  contact_name = wait.until{@driver.find_element(:id => 'contact_name')}
  contact_name.long
  wait.until{@driver.find_element(:id => 'popuponfirm').click}

end


Then(/^I should not be able to add the same contact twice$/) do

  wait.until{@driver.find_element(:id => 'settins').click}
  wait.until{@driver.find_element(:id => 'contact').click}
  wait.until{@driver.find_element(:id => 'addcontact_button').click}
  caregiver_info = wait.until{@driver.find_element(:id => 'name')}
  caregiver_info.send_keys 'caregivername'
  caregiver_phone = @driver.find_element(:id => 'caregiverphone')
  caregiver_phone.send_keys 'duplicated_phone'
  @driver.find_element(:id => 'relationship').click
  wait.until{@driver.find_element(:id => 'relationship_selection').click}

  consent_dropdown =   wait.until{@driver.find_element(:id => 'consent')}
  if consent_dropdown.selected?
    consent_dropdown.click
    click_save_button

  else

    click_save_button
  end
  expect(wait.until{@driver.find_element(:id => 'header_error').text.to include('Contact already exist')})
  @driver.alert_accept
  puts 'Contact added successfully'.upcase
end