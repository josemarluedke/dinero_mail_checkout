# DineroMailCheckout

Dineromail simple checkout integration with Ruby

## Installation

Add this line to your application's Gemfile:

    gem 'dinero_mail_checkout'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dinero_mail_checkout

## Usage

### General Configuration

    DineroMailCheckout.configure do |config|
      config.payment_method = 'all'
      config.merchant = 'merchant_number'
      config.logo_url = 'http://localhost:3000/assets/logo.png'
      config.success_url = 'http://localhost:3000/success_page'
      config.error_url = 'http://localhost:3000/error_page'
      config.currency = DineroMailCheckout::Configuration::Currency::CLP
      config.country_id = 2
    end

### Example rails controller

    class DineromailController < ApplicationController
      def pay
        transaction_id = (Digest::MD5.hexdigest "#{SecureRandom.hex(5)}-#{DateTime.now.to_s}")[1..20].downcase
        data = DineroMailCheckout::CheckoutData.validate({item_name_1: "Product",
                                                          item_quantity_1: 1,
                                                          item_currency_1: DineroMailCheckout.configuration.currency,
                                                          change_quantity: 0,
                                                          item_ammount_1: 100,
                                                          buyer_name: "Customer Name",
                                                          buyer_email: "email@gmail.com",
                                                          transaction_id: transaction_id})
        redirect_to DineroMailCheckout::Client.get_uri(data)
      end
    end
### IPN
  
  For IPN, use the [dinero_mail_ipn](http://github.com/etagwerker/dinero_mail_ipn) gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
