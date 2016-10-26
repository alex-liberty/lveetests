# encoding: utf-8
require 'selenium-webdriver'

load 'config.rb'

module Cr
 class Createcl

  def login(login)
   @login = login
  end

  def password(password)
   @password = password
  end

  def namecof(namecof)
   @namecof = namecof
  end

   def create
    Capybara.visit("#{SITE}")
    Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[1]/a').click
    #Capybara.click_link('Log')
    Capybara.fill_in('login', :with => @login) #@login
    Capybara.fill_in('password', :with => @password)
    Capybara.click_button('Log')
    Capybara.visit("#{SITE} + /admin/conferences") #.//*[@id='sub-menu']/li[2]/ul/li[2]/a
    # Capybara.click_link('Admin')
    # Capybara.visit Capybara.find('a', :text => 'Conferences admin')[:href]
    Capybara.click_link('as_admin__conferences-new--link')
    Capybara.fill_in('record_name_', :with => @namecof)
    Capybara.fill_in('record_start_date_', :with => '2016-11-30')
    Capybara.fill_in('record_finish_date_',:with => '2016-12-14')
    sleep 3
    Capybara.check('record_registration_opened_')
    Capybara.click_button('Create')
   end


 end
end

c = Cr::Createcl.new
c.login('Darling')
c.password('6279508')
c.namecof('test5')
c.create
