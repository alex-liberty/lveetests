# encoding: utf-8
load 'config.rb'
require 'selenium-webdriver'

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
    Capybara.attach_file('user_avator', './lvee.png')
    Capybara.click_button('Upload')
    sleep 3
    #Capybara.find("//input[@type='file']", :with => '/media/files/Photo/Аватарки/DSC_0700.jpg')

   end
 end
end

ch = Av::Change.new('Darling', 6279508, "#{SITE}")
ch.create


