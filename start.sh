
ruby registrationlocal.rb
source ~/.rvm/scripts/rvm
cd ./lvee-engine
rake get_role_admin
cd ..
ruby createconference.rb
ruby registrationlocal.rb
ruby regconf_approve.rb

