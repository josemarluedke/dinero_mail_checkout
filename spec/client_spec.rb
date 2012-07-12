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
    it "should redirect to DineroMail checkout page" do
      data = {country_id: 2, item_name_1: "Name", item_quantity_1: 1, item_ammount_1: 10}
      DineroMailCheckout::Client.get_uri(data).should =~ /checkout.dineromail.com\/CheckOut\?country_id=2&item_name_1=Name&item_quantity_1=1&item_ammount_1=10&merchant=merchant&payment_method_available=all&ok_url=http%3A%2F%2Flocalhost%3A3000%2Fsuccess_page&error_url=http%3A%2F%2Flocalhost%3A3000%2Ferror_page&currency=clp/
    end
  end
end
