
require "selenium-webdriver"
require "appium_lib"
require "rspec"
require "rspec/expectations"
require "cucumber"
require "rdoc"
require "pp"
require "pry"
include RSpec::Matchers
include RSpec::Expectations






Before do
  def capabilities
    capabilities = {
        'appium-version': '1.0',
        'platformName': 'Android',
        'platformVersion': '6.0',
        'newCommandTimeout': '5000',
        'deviceName': 'Nexus J3',
        'app': '/Users/B.Masoko/Desktop/GIZMOPAL/apks/Vzw_GizmoPal_2_3_42_Test_debug.apk',
    }
  end
  #'--no-reset': 'true',
  def server_url
    "http://127.0.0.1:4723/wd/hub"
  end

=begin
def appium_driver
 @driver= Appium::Driver.new(caps: capabilities).start_driver
 Appium.promote_appium_methods Object
end
=end



 @driver = Selenium::WebDriver.for :remote,

                                   desired_capabilities: capabilities,
                                   url: "http://127.0.0.1:4723/wd/hub"
  def pair_gizmo


      @get_started = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/introNextButton'))}
      @get_started.click

      # I should see the continue button$
      continue_button = wait.until{@driver.find_element(:xpath, '//android.widget.Button[2]')}
      continue_button.click

      # I should see the permission popup buttons
      #3.times do
      #  permission_popup = wait.until{(@driver.find_element(:xpath, '//android.widget.Button[2]'))}
      #  permission_popup.click
      #end

      permission_popup = wait.until{(@driver.find_element(:xpath, '//android.widget.Button[2]'))}
      permission_popup.click if permission_popup.displayed?.to be_truthy


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

      #check if there is a phone number

      phone_number =  wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupCaretakerMdn').clear)}
      sleep 3
      phone_number.send_keys(6462002347)


      #End phone number check

      # I should be redirected to personalize your gizmo page
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText'))}
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText').click)}
      wait.until{(@driver.find_element(:id, 'android:id/text1').click)}

      click_next_button

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
      expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader').text.eql? 'Linking to Your Gizmo')})

      # I should see allow contacts popup


      allow_contact = wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button'))}
      allow_contact.click

      #Contact exists


      @contact_exists = wait.until{(@driver.find_element(:id => 'android:id/button1'))}

      if @contact_exists
        @contact_exists.click
      else

      end

      2.times do
        click_next_button
      end

=begin
  # I may see the app upgrade if there is a new version
  #wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button').click)}

  # I should be on the dashboard -check for the call image
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/toolbar_call_imageview'))})

    puts "The gizmo was successfully paired to your devices".upcase
=end

      expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/gizmopal_locate').click)})

    end



  def wait
    Selenium::WebDriver::Wait.new :timeout => 60
  end

  def success
    puts 'Scenario: PASS'.upcase
  end

  def click_next_button
    wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}
  end

  def click_done_button
    done = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
    if
    done
    then click_next_button
    end
  end

  def clicks_counter
    iterations = 0
    iterations+= iterations
    puts "Number of clicks:#{iterations}"
  end

  def click_save_button
    wait.until{@driver.find_element(:id => 'android:id/button1').click}
  end

  def click_cancel_button
    wait.until{@driver.find_element(:id => 'android:id/button2').click}
  end

  def validate_phone_number

    phone_number =  wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupCaretakerMdn'))}

    if phone_number.text.eql("")
      phone_number.send_keys(6462002347)

      # I should be redirected to personalize your gizmo page
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText'))}
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText').click)}
      wait.until{(@driver.find_element(:id, 'android:id/text1').click)}

      click_next_button
      # add contact to contact list
      @driver.find_element(:id => 'android:id/button1').click if @driver.find_element(:id => 'android:id/button1').displayed?
    else
      # I should be redirected to personalize your gizmo page
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText'))}
      wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText').click)}
      wait.until{(@driver.find_element(:id, 'android:id/text1').click)}

      click_next_button
    end
  end
end



After do
  #@driver.quit
end

