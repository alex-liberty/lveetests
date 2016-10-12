# encoding: utf-8
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

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


module Reg
  class Registration

    def login(login)
      @login = login
    end

    def password(password)
      @password = password
    end

    def loginadmin(loginadmin)
      @loginadmin = loginadmin
    end

    def passwordadmin(passwordadmin)
      @passwordadmin = passwordadmin
    end

    def loginfirst

      # #логинимся
      Capybara.visit('http://localhost:3000/')
      Capybara.click_link('Log')
      Capybara.fill_in('login', :with => @login) #Fongieunique
      Capybara.fill_in('password', :with => @password)
      Capybara.click_button('Log')

    end

    def reg_conference_first
      # #регимся в первый раз
      Capybara.click_link('Register to test1') #заменить на XPath
      Capybara.fill_in('record_proposition_', :with => 'testing site')
      Capybara.fill_in('record_quantity_', :with => '5')
      Capybara.click_button('Create')
      Capybara.click_on('Logout')
    end

    def login_admin
      #тут логинимся за админа
      Capybara.visit('http://localhost:3000/') #переделать
      Capybara.click_link('Log')
      Capybara.fill_in('login', :with => 'Darling')
      Capybara.fill_in('password', :with => 6279508)
      Capybara.click_button('Log')

    end

    def approve_user
      Capybara.visit('http://localhost:3000/en/admin/conference_registrations') #.//*[@id='sub-menu']/li[2]/ul/li[4]
      Capybara.click_link('as_admin__conference_registrations-edit-1-link') #сделать по имени

         #или апрув алл
      Capybara.find('#record_status_name').click
      Capybara.select('approved')
      Capybara.click_button('Update')
      Capybara.click_on('Logout')

    end

    def approve_all
      Capybara.visit('http://localhost:3000/en/admin/conference_registrations') #.//*[@id='sub-menu']/li[2]/ul/li[4]
      Capybara.click_link('as_admin__conference_registrations-approve_all--link')
      Capybara.find('#conference_id').click
      Capybara.select('test1')
      Capybara.click_button('Approve all')
      #sleep 20
      Capybara.click_on('Logout')
    end


        #login

    def two_anketa
      #вторая анкета
      Capybara.find(:xpath, '//*[@id="login-panel"]/ul/li[1]').click
      Capybara.find(:xpath, './/*[@id="article-bg"]/div[1]/p[5]/a[1]').click
      #Capybara.find(:a, :text => 'Confirm').click_link
      sleep 5
      Capybara.check('record_days_', match: :first)
      Capybara.fill_in('record_meeting_1', :with => '+375256279508')
      Capybara.check('record_floor')
      #Capybara.click_button('Select')
      Capybara.find('#record_transport_to').find(:xpath, 'option[2]').select_option
      Capybara.find('#record_transport_from').find(:xpath, 'option[2]').select_option
      Capybara.find('#record_tshirt_', match: :first).find(:xpath, 'option[2]').select_option
      Capybara.click_button('Update')

    end

  end
end


yes = Reg::Registration.new
logins = []


yes.login('Onarirarounique')
yes.password(6279508)
# yes.loginadmin(loginadmin)
# yes.passwordadmin(passwordadmin)
# login = 'Onarirarounique'
# password = '6279508'
# loginadmin = 'Darling'
# passwordadmin = '6279508'
#yes.loginfirst
#yes.reg_conference_first
yes.login_admin
#yes.approve_user
yes.approve_all
yes.loginfirst
yes.two_anketa
logins = logins + [login + ' ' + password]
puts logins