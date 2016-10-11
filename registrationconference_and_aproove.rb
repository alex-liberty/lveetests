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

# #логинимся
# Capybara.visit('http://localhost:3000/')
# Capybara.click_link('Log')
# Capybara.fill_in('login', :with => 'Fongieunique')
# Capybara.fill_in('password', :with => '6279508')
# Capybara.click_button('Log')
#
# #регимся в первый раз
# Capybara.click_link('Register to test1') #заменить на XPath
# Capybara.fill_in('record_proposition_', :with => 'testing site')
# Capybara.fill_in('record_quantity_', :with => '5')
# Capybara.click_button('Create')
# Capybara.click_on('Logout')
# sleep 20

#тут логинимся за админа
Capybara.visit('http://localhost:3000/') #переделать
Capybara.click_link('Log')
Capybara.fill_in('login', :with => 'Darling')
Capybara.fill_in('password', :with => '6279508')
Capybara.click_button('Log')

#approve user
Capybara.visit('http://localhost:3000/en/admin/conference_registrations') #.//*[@id='sub-menu']/li[2]/ul/li[4]
Capybara.click_link('as_admin__conference_registrations-edit-1-link') #сделать по имени
												#или апрув алл
Capybara.find('#record_status_name').click
Capybara.select('approved')
Capybara.click_button('Update')
Capybara.click_on('Logout')

Capybara.visit('http://localhost:3000/')
Capybara.click_link('Log')
Capybara.fill_in('login', :with => 'Fongieunique')
Capybara.fill_in('password', :with => '6279508')
Capybara.click_button('Log')
#вторая анкета
Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[1]').click
Capybara.find(:xpath, './/*[@id="article-bg"]/div[1]/p[5]/a[1]').click
#Capybara.find(:a, :text => 'Confirm').click_link
sleep 20
Capybara.check('record_days_', match: :first)
Capybara.fill_in('record_meeting_1', :with => '+375256279508')
Capybara.check('record_floor')
#Capybara.click_button('Select')
Capybara.find('#record_transport_to').find(:xpath, 'option[2]').select_option
Capybara.find('#record_transport_from').find(:xpath, 'option[2]').select_option
Capybara.find('#record_tshirt_', match: :first).find(:xpath, 'option[2]').select_option
Capybara.click_button('Update')
