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
module Av
 class Change

  def initialize(login, pass, site)
    @login, @pass, @site = login, pass, site
  end

   def create

    Capybara.visit(@site)
    Capybara.click_link('Log')
    Capybara.fill_in('login', :with => @login)
    Capybara.fill_in('password', :with => @pass)
    Capybara.click_button('Log')
    Capybara.attach_file('user_avator', '/media/files/Photo/Аватарки/1.jpeg')
    Capybara.click_button('Upload')
    sleep 3
    #Capybara.find("//input[@type='file']", :with => '/media/files/Photo/Аватарки/DSC_0700.jpg')

   end
 end
end

ch = Av::Change.new('Pelyamarunique', 6279508, 'http://localhost:3000/')
# ch.site('http://localhost:3000/')
# ch.login('Pelyamarunique')
# ch.pass(6279508)
ch.create


