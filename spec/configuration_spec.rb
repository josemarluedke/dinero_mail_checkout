require 'spec_helper'

describe DineroMailCheckout do
  subject do
    DineroMailCheckout.configure do |config|
      config.payment_method = 'all'
      config.merchant = 'merchant_number'
      config.logo_url = 'http://localhost:3000/assets/logo.png'
      config.success_url = 'http://localhost:3000/success_page'
      config.error_url = 'http://localhost:3000/error_page'
      config.currency = DineroMailCheckout::Configuration::Currency::CLP
    end
    DineroMailCheckout.configuration
  end
  its(:payment_method){ should == "all" }
  its(:merchant){ should == "merchant_number" }
  its(:logo_url){ should == "http://localhost:3000/assets/logo.png" }
  its(:success_url){ should == "http://localhost:3000/success_page" }
  its(:error_url){ should == "http://localhost:3000/error_page" }
  its(:currency){ should == DineroMailCheckout::Configuration::Currency::CLP }
end
