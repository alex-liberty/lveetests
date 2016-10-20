require 'capybara'
require 'capybara/dsl'

include Capybara::DSL

SITE = "http://localhost:3000/"


Capybara.default_driver = :chrome
 Capybara.register_driver :chrome do |app|
 # options = {
 # :js_errors => false,
 # :timeout => 360,
 # :debug => false,
 # :inspector => false,
 # }
 Capybara::Selenium::Driver.new(app, :browser => :chrome)
 end
#Capybara.current_driver = :selenium
