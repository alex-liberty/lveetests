# encoding: utf-8
load 'config.rb'

Capybara.visit('https://lvee.org')
Capybara.click_link('Log')
Capybara.click_link('Restore')
Capybara.fill_in('email', :with => 'galinabalashkova@gmail.com')
Capybara.click_button('Password Restore')
sleep 5
