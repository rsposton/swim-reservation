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
puts "Test Passed: Login button found" if button.displayed?

button.click

schedule_button = wait.until {
    element = driver.find_element(:css, "button[class='btn white darker-blue-bg float-right mr-2']")
    element if element.displayed?
}
puts "Test Passed: Schedule button found" if schedule_button.displayed?

schedule_button.click

select_location_radio = wait.until {
    element = driver.find_element(:xpath, "//span[text()='Bay Club Redwood Shores']")
    element if element.displayed?
}
puts "Test Passed: Select location found" if select_location_radio.displayed?

select_location_radio.click

continue_schedule_button = wait.until {
    element = driver.find_element(:css, "div[class='btn btn-light-blue w-100']")
    element if element.displayed?
}
puts "Test Passed: Continue Schedule button found" if continue_schedule_button.displayed?

continue_schedule_button.click

select_lap_pool = wait.until {
    element = driver.find_element(:xpath, "//*[text()='Adult Lap Pool']")
    #element = driver.find_element(:xpath, "//*[text()='Recreation/Lap Pool']")
    element if element.displayed?
}
puts "Test Passed: Select Lap Pool" if select_lap_pool.displayed?

select_lap_pool.click

next_button = wait.until {
    element = driver.find_element(:css, "div[class='col-auto slider-item clickable pr-3']")
    element if element.displayed?
}
puts "Test Passed: Next button ('>') on schedule" if next_button.displayed?

next_button.click

select_kathleen = wait.until {
    element = driver.find_element(:css, "div[class='person-select-item mr-3 mb-3 d-flex flex-column align-items-center clickable avatar-small ng-star-inserted']")
    element if element.displayed?
}
puts "Test Passed: Select Kathleen" if select_kathleen.displayed?

select_regan = wait.until {
    element = driver.find_element(:css, "div[class='person-select-item mr-3 mb-3 d-flex flex-column align-items-center clickable avatar-small ng-star-inserted selected']")
    element if element.displayed?
}
puts "Test Passed: Deselect Regan" if select_regan.displayed?

select_kathleen.click
select_regan.click

day_number = (Time.now+(60*60*24*7)).day

select_day = wait.until {
    element = driver.find_element(:xpath, "//*[text()='#{day_number}']")
    element if element.displayed?
}
puts "Test Passed: Press date (#{day_number}) on schedule" if select_day.displayed?

select_day.click

sleep 2


if (driver.find_element(:xpath, "//*[text()=' You can book only 7 days in advance ']") rescue false)
    day_number = (Time.now+(60*60*24*6)).day

    select_day = wait.until {
        element = driver.find_element(:xpath, "//*[text()='#{day_number}']")
        element if element.displayed?
    }
    puts "Test Passed: Press date (#{day_number}) on schedule" if select_day.displayed?

    select_day.click    
end



select_end_time = wait.until {
    element = driver.find_element(:css, ".hour-item [data-hourindex='1'][data-slotindex='0']")
    element if element.displayed?
}
puts "Test Passed: Hour selected" if select_end_time.displayed?

select_end_time.click
puts "click 1"
sleep 1

period_time_end = wait.until {
    element = driver.find_element(:xpath, "(//app-time-range//span)[2]")
    element if element.displayed?
}
puts "Test Passed: Time end selected" if period_time_end.displayed?
period_time_end.click

select_expand_time = wait.until {
    element = driver.find_element(:xpath, "//*[@class='popover-content popover-body']//*[@class='row no-gutters text-center']//*[@class='col mx-2']")
    element if element.displayed?
}
puts "Test Passed: Plus 30 mins selected" if select_expand_time.displayed?
select_expand_time.click
select_expand_time.click
select_expand_time.click
sleep 1

# click on time period to close modal
period_time_end.click

confirm_button = wait.until {
    element = driver.find_element(:css, "button[class='btn btn-info text-uppercase w-100 py-2 px-8']")
    element if element.displayed?
}
puts "Test Passed: Confirm button found" if confirm_button.displayed?

confirm_button.click

sleep 5

puts "End Success" if wait.until {
    /Bay Club Connect/.match(driver.page_source)
}

# Drop browser object
driver.quit
