# encoding: utf-8
load 'config.rb'
Capybara.visit("#{SITE}")
Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[3]/a').click
Capybara.fill_in('record_login_', :with => 'Hunny')
Capybara.fill_in('record_password_', :with => '6279508')
Capybara.fill_in('record_password_confirmation_', :with => '6279508')
Capybara.fill_in('record_email_', :with => '1_11@tut.by')
Capybara.fill_in('record_first_name_', :with => 'Galina')
Capybara.fill_in('record_last_name_', :with => 'Test')
Capybara.find('#record_country_').find(:xpath, 'option[2]').select_option #first Belarus
#Capybara.select("Albania", :from => 'record_country') # except duplicated countries
Capybara.fill_in('record_city_', :with => 'Minsk')
Capybara.fill_in('record_occupation_', :with => 'Test')
#Capybara.check('record_subscribed_')
#Capybara.check('record_subscribed_talks_')
Capybara.click_button('Create')
sleep 10
