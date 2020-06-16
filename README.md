
### Install required gems
```
  gem install selenium-webdriver
  gem install webdrivers
```
### Run ruby command line
```
  USR=[username] PWD=[password] URL=[domain] ruby demo.rb
```



###Error received
```
element = driver.find_element(:xpath, "//div[@data-hourindex='0']")
```

**Gets this Error:**
```
element click intercepted: Element <div _ngcontent-dfc-c41="" class="time-slot time-slot-header ng-tns-c41-1 ng-star-inserted" data-hourindex="0" data-slotindex="0" style="height: 30px;"></div> is not clickable at point (124, 436). Other element would receive the click: <div _ngcontent-dfc-c41="" class="hour">...</div> (Selenium::WebDriver::Error::ElementClickInterceptedError)
```
