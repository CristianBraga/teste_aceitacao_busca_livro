Bundler.require :default
Bundler.require :lib

RSpec.configure do |rspec_config|
    rspec_config.include PageObject::PageFactory

    rspec_config.before(:context) do
      @browser = Selenium::WebDriver.for :chrome

      @driver = @browser

      @browser.manage.timeouts.implicit_wait = 10

      @browser.manage.timeouts.page_load = 60

      @browser.manage.window.maximize
    end

    rspec_config.after(:context) do
      @browser.quit
    end
end
