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
      config.country_id = 2
    end
    DineroMailCheckout.configuration
  end
  its(:payment_method){ should == "all" }
  its(:merchant){ should == "merchant_number" }
  its(:logo_url){ should == "http://localhost:3000/assets/logo.png" }
  its(:success_url){ should == "http://localhost:3000/success_page" }
  its(:error_url){ should == "http://localhost:3000/error_page" }
  its(:currency){ should == DineroMailCheckout::Configuration::Currency::CLP }
  its(:country_id){ should == 2 }

  describe "country name feature" do
    it "with 1, should return argentina" do
      DineroMailCheckout::Configuration.country_name(1).should == "argentina"
    end
    it "with 2, should return brasil" do
      DineroMailCheckout::Configuration.country_name(2).should == "brasil"
    end
    it "with 3, should return chile" do
      DineroMailCheckout::Configuration.country_name(3).should == "chile"
    end
    it "with 4, should return mexico" do
      DineroMailCheckout::Configuration.country_name(4).should == "mexico"
    end
  end
end
