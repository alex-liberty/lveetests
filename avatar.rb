# encoding: utf-8
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'


include Capybara::DSL

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

Capybara.visit('http://localhost:3000/')
Capybara.click_link('Log')
Capybara.fill_in('login', :with => 'Pelyamarunique')
Capybara.fill_in('password', :with => '6279508')
Capybara.click_button('Log')
Capybara.attach_file('user_avator', '/media/files/Photo/Аватарки/1.jpeg')
Capybara.click_button('Upload')
#sleep 20
#Capybara.find("//input[@type='file']", :with => '/media/files/Photo/Аватарки/DSC_0700.jpg')


