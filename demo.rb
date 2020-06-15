require 'selenium-webdriver'
require 'webdrivers'

USR = ENV["USR"]
PWD = ENV["PWD"]
URL = ENV["URL"]

# start an instance of firefox with selenium-webdriver
driver = Selenium::WebDriver.for :chrome # generate browser object

driver.get "#{URL}"

# wait for a specific element to show up
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

puts "Test Passed: Page 1 Validated" if wait.until {
    /Bay Club Connect/.match(driver.page_source)
}

input_username = wait.until {
    username = driver.find_element(:id, "username")
    username if username.displayed?
}
input_username.send_keys("#{USR}")

input_password = wait.until {
    password = driver.find_element(:id, "password")
    password if password.displayed?
}
input_password.send_keys("#{PWD}")

button = wait.until {
    element = driver.find_element(:css, "button[class='btn btn-light-blue mt-1 text-uppercase w-100 btn-big font-weight-bold letter-spacing-1']")
    element if element.displayed?
}
puts "Test Passed: Form input found" if button.displayed?

button.click

schedule_button = wait.until {
    element = driver.find_element(:css, "button[class='btn white darker-blue-bg float-right mr-2']")
    element if element.displayed?
}
puts "Test Passed: Form input found" if schedule_button.displayed?

schedule_button.click


puts "End Success" if wait.until {
    /Bay Club Connect Stuff/.match(driver.page_source)
}

# Drop browser object
driver.quit
