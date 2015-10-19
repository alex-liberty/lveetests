# encoding: utf-8
require 'capybara'
require 'capybara/dsl'

include Capybara::DSL


Capybara.current_driver = :selenium
Capybara.visit('https://lvee.org')
Capybara.click_link('Log')
Capybara.fill_in('login', :with => 'test')
Capybara.fill_in('password', :with => '6279508')
Capybara.click_button('Log')
Capybara.attach_file('user_avator', '/media/files/Photo/Аватарки/1.jpeg')
Capybara.click_button('Upload')
sleep 20
#Capybara.find("//input[@type='file']", :with => '/media/files/Photo/Аватарки/DSC_0700.jpg')


