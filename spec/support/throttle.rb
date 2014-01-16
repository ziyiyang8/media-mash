require 'selenium-webdriver'
module ::Selenium::WebDriver::Firefox
  class Bridge
    attr_accessor :speed

    def execute(*args)
      result = raw_execute(*args)['value']
      case speed
        when :slow
          sleep 0.3
        when :medium
          sleep 0.1
      end
      result
    end
  end
end

def set_speed(speed)
  begin
    page.driver.browser.send(:bridge).speed=speed
  rescue
  end
end