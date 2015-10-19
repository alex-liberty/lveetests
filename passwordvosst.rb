# encoding: utf-8
require 'capybara'
require 'capybara/dsl'

include Capybara::DSL

Capybara.current_driver = :selenium
Capybara.visit('https://lvee.org')
Capybara.click_link('Log')
Capybara.click_link('Restore')
Capybara.fill_in('email', :with => 'galinabalashkova@gmail.com')
Capybara.click_button('Password Restore')
sleep 5
