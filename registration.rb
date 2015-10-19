# encoding: utf-8
require 'capybara' 
require 'capybara/dsl' 

include Capybara::DSL


Capybara.current_driver = :selenium
Capybara.visit('https://lvee.org')
Capybara.click_link('Register')
Capybara.fill_in('record_login_', :with => 'dgxdfmxcvc')
Capybara.fill_in('record_password_', :with => '6279508')
Capybara.fill_in('record_password_confirmation_', :with => '6279508')
Capybara.fill_in('record_email_', :with => 'siagaedr@fakeinbox.com')
Capybara.fill_in('record_first_name_', :with => 'Galina')
Capybara.fill_in('record_last_name_', :with => 'Test')
#Capybara.click('record_country')
#Capybara.click('Belarus')
Capybara.fill_in('record_city_', :with => 'Minsk')
Capybara.fill_in('record_occupation_', :with => 'Test')
Capybara.check('record_subscribed_')
Capybara.check('record_subscribed_talks_')
Capybara.click_button('Register')
sleep 10