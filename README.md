
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

```
<div _ngcontent-kaf-c42="" class="row hour-row no-gutters ng-tns-c42-3 ng-star-inserted" style="">
  <div _ngcontent-kaf-c42="" class="col-2 hour-container">
    <div _ngcontent-kaf-c42="" class="hour-background">
      <div _ngcontent-kaf-c42="" class="hour">6</div>
      <div _ngcontent-kaf-c42="" class="abbreviation">AM</div>
    </div>
    <!---->
    <div _ngcontent-kaf-c42="" class="time-slot time-slot-header ng-tns-c42-3 ng-star-inserted" data-hourindex="0" data-slotindex="0" style="height: 30px;"></div>
    <div _ngcontent-kaf-c42="" class="time-slot time-slot-header ng-tns-c42-3 ng-star-inserted" data-hourindex="0" data-slotindex="1" style="height: 30px;"></div>
    </div>
  <div _ngcontent-kaf-c42="" class="col-10 hour-item">
  <!---->
    <div _ngcontent-kaf-c42="" class="time-slot time-slot-item ng-tns-c42-3 ng-star-inserted" data-hourindex="0" data-slotindex="0" style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: 30px;"></div>
    <div _ngcontent-kaf-c42="" class="time-slot time-slot-item ng-tns-c42-3 ng-star-inserted" data-hourindex="0" data-slotindex="1" style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: 30px;"></div>
  </div>
</div>
```
