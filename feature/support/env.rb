require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require "watir-webdriver/wait"
require 'Capybara'
require "capybara/cucumber"

Given /^that I am on (.*)$/ do |page|
  BROWSER.goto(PAGES[page])
end


Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
 end
 

Capybara.default_driver = :chrome
Capybara.app_host = "https://cs20.salesforce.com/"
Capybara.default_wait_time =20


ENV['TEST_ENV'] = 'Test'

def env
  case ENV['TEST_ENV']
  
    when /Test/ then "https://cs20.salesforce.com/"
  else
      "https://cs20.salesforce.com/"
  end
end
