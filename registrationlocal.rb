# coding: utf-8
require 'capybara'
require 'capybara/dsl'

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
#Capybara.current_driver = :selenium
module MyModule

  class Registrator

    def login(login)
      @login = login
    end

    def email(email)
      @email = email
    end

    def rules_agree
      Capybara.visit('http://localhost:3000/')
      Capybara.click_link('Register')
       #find('.data-agreement > label:nth-child(2)').click
    end

    def form_filling

      #Capybara.current_driver = :selenium
      #   Capybara.visit('https://lvee.org')
      #   Capybara.click_link('Register')
      Capybara.fill_in('record_login_', :with => @login)
      Capybara.fill_in('record_password_', :with => '6279508')
      Capybara.fill_in('record_password_confirmation_', :with => '6279508')
      Capybara.fill_in('record_email_', :with => @email)
      Capybara.fill_in('record_first_name_', :with => 'Galina')
      Capybara.fill_in('record_last_name_', :with => 'Test')
      Capybara.find('#record_country_').find(:xpath, 'option[2]').select_option #first Belarus
      #Capybara.select("Albania", :from => 'record_country') # except duplicated countries
      Capybara.fill_in('record_city_', :with => 'Minsk')
      Capybara.fill_in('record_occupation_', :with => 'Test')
      #Capybara.check('record_subscribed_')
      #Capybara.check('record_subscribed_talks_')
      Capybara.click_button('Create')
    end

    def nick_generate
      Capybara.visit('http://nick-name.ru/generate/')
      Capybara.click_on('generate')
      return Capybara.find_field('resname').value
    end

    def email_generate
      Capybara.visit 'http://www.fakeinbox.com/'
      Capybara.find('#random input ').click
      return Capybara.find_field('mail').value
    end

    def email_regenerate
      Capybara.visit 'http://www.fakeinbox.com/'
      Capybara.click_on('Delete E-mail Address')
      Capybara.find('#random input ').click
      return Capybara.find_field('mail').value
    end

    def email_confirm
      sleep 5
      Capybara.visit 'http://www.fakeinbox.com/'
      #sleep 5
      #Capybara.click_on('Show')
	    sleep 5
      Capybara.visit Capybara.find('a', :text => 'Show')[:href]
      Capybara.visit Capybara.find('a', :text => 'http://localhost:3000/activate')[:href]
    end
    
    def user_logout
      Capybara.click_on('Logout')
      sleep 10
    end
  end
end

t = MyModule::Registrator.new
logins = []

puts 'Enter a number of registration users'
numberOfUsers = gets.chomp

i=0
while i < numberOfUsers.to_i
  login =t.nick_generate + 'unique'
  if (i==0)
    email =t.email_generate
  else email =t.email_regenerate
  end
  t.login(login)
  t.email(email)
  t.rules_agree
  t.form_filling
  t.email_confirm
  t.user_logout
  logins = logins + [login + ' ' + email]
  i+=1
end

puts logins
