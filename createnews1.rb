# encoding: utf-8
require 'capybara'
require 'capybara/dsl'
#require 'capybara-webkit'
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

module News
  class New

    def login(login)
      @login = login
    end

    def password(password)
      @password = password
    end

    def create
      Capybara.visit('http://localhost:3000/en/main')
      Capybara.click_link('Log')
      Capybara.fill_in('login', :with => @login) #@login
      Capybara.fill_in('password', :with => @password)
      Capybara.click_button('Log')
      Capybara.visit('http://localhost:3000/en/news/') #.//*[@id='sub-menu']/li[2]/ul/li[2]/a
      Capybara.click_link('Add News')
      Capybara.fill_in('news_title', :with => 'testnews')
      Capybara.fill_in('news_lead', :with => 'testtext')
      Capybara.fill_in('news_body', :with => 'testststststtststststst')
      sleep 3
      Capybara.click_button('Save')
    end


  end
end

c = News::New.new
c.login('Darling')
c.password('6279508')
c.create

