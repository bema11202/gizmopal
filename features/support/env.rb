
require "selenium-webdriver"
require "appium_lib"
require "rspec"
require "rspec/expectations"
require "cucumber"
require "rdoc"
require "pp"

Before do
  def capabilities
    capabilities = {
        'appium-version': '1.0',
        'platformName': 'Android',
        'platformVersion': '6.0',
        'deviceName': 'Nexus J3',
        'app': '/Users/B.Masoko/Desktop/GIZMOPAL/apks/Vzw_GizmoPal_2_3_42_Test.apk',
    }
  end

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


end




After do
  @driver.quit
end

