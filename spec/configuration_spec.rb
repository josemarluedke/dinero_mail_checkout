require 'spec_helper'

describe DineroMailCheckout do
  subject do
    DineroMailCheckout.configure do |config|
      config.pay_methods = 'all'
      config.account_number = 'account_number'
      config.password = 'password'
      config.logo_url = 'http://localhost:3000/assets/logo.png'
      config.success_url = 'http://localhost:3000/success_page'
      config.error_url = 'http://localhost:3000/error_page'
      config.currency = DineroMailCheckout::Configuration::PESO
    end
    DineroMailCheckout.configuration
  end
  its(:pay_methods){ should == "all" }
  its(:account_number){ should == "account_number" }
  its(:password){ should == "password" }
  its(:logo_url){ should == "http://localhost:3000/assets/logo.png" }
  its(:success_url){ should == "http://localhost:3000/success_page" }
  its(:error_url){ should == "http://localhost:3000/error_page" }
  its(:currency){ should == DineroMailCheckout::Configuration::PESO }
end
