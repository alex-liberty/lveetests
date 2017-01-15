load 'config.rb'

Capybara.visit("#{SITE}")
#puts Capybara.find('#sub-menu').text
Capybara.all(:xpath, './/li[@class="sub"]').each do |x| puts x.hover; Capybara.all(:xpath, './/li[@class="sub"]/ul/li').each do |x| puts x.text end end
