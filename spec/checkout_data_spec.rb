require 'spec_helper'

describe DineroMailCheckout do
  describe "validations" do
    before do
      DineroMailCheckout.configure do |config|
        config.payment_method = 'all'
        config.merchant = 'merchant'
        config.logo_url = 'http://localhost:3000/assets/logo.png'
        config.success_url = 'http://localhost:3000/success_page'
        config.error_url = 'http://localhost:3000/error_page'
        config.currency = DineroMailCheckout::Configuration::Currency::CLP
      end
    end

    it "should raise error on miss merchant" do
      DineroMailCheckout.configuration.merchant = nil
      lambda{ DineroMailCheckout::CheckoutData.validate }.should raise_error(DineroMailCheckout::MissingMerchantError)
    end

    it "should raise error on miss country id" do
      lambda{ DineroMailCheckout::CheckoutData.validate }.should raise_error(DineroMailCheckout::MissingCountryIdError)
    end

    it "should raise error on miss item name" do
      data = {country_id: 2}
      lambda{ DineroMailCheckout::CheckoutData.validate(data) }.should raise_error(DineroMailCheckout::MissingItemNameError)
    end

    it "should raise error on miss item quantity" do
      data = {country_id: 2, item_name_1: "Name"}
      lambda{ DineroMailCheckout::CheckoutData.validate(data) }.should raise_error(DineroMailCheckout::MissingItemQuantityError)
    end

    it "should raise error on miss item ammount" do
      data = {country_id: 2, item_name_1: "Name", item_quantity_1: 1}
      lambda{ DineroMailCheckout::CheckoutData.validate(data) }.should raise_error(DineroMailCheckout::MissingItemAmmountError)
    end

    it "should don't have a error" do
      data = {country_id: 2, item_name_1: "Name", item_quantity_1: 1, item_ammount_1: 10}
      lambda{ DineroMailCheckout::CheckoutData.validate(data) }.should_not raise_error
    end

    it "should return the all data" do
      data = {country_id: 2, item_name_1: "Name", item_quantity_1: 1, item_ammount_1: 10}
      DineroMailCheckout::CheckoutData.validate(data).should == {country_id: 2, item_name_1: "Name", item_quantity_1: 1, item_ammount_1: 10, merchant: "merchant", payment_method_available: "all", ok_url: "http://localhost:3000/success_page", error_url: "http://localhost:3000/error_page", currency: "clp"}
    end

  end
end
