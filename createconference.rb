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

module Createconference
 class Createconference

  def login(login)
   @login = login
  end

  def password(password)
   @password = password
  end

   def create
    Capybara.visit('http://localhost:3000/')
    Capybara.click_link('Log')
    Capybara.fill_in('login', :with => @login)
    Capybara.fill_in('password', :with => @password)
    Capybara.click_button('Log')
    Capybara.visit('http://localhost:3000/en/admin/conferences') #.//*[@id='sub-menu']/li[2]/ul/li[2]/a
    # Capybara.click_link('Admin')
    # Capybara.visit Capybara.find('a', :text => 'Conferences admin')[:href]
    Capybara.click_link('as_admin__conferences-new--link')
    Capybara.fill_in('record_name_', :with => 'test1')
    Capybara.fill_in('record_start_date_', :with => '2016-11-30')
    Capybara.fill_in('record_finish_date_',:with => '2016-12-14')
    sleep 3
    Capybara.check('record_registration_opened_')
    Capybara.click_button('Create')
   end
 end
end

c = Createconference::Createconference.new

login =
password =
c.create

