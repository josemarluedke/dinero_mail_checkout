require 'uri'

module DineroMailCheckout
  class Client
    class << self
      def get_uri(data)
        "#{DineroMailCheckout::Configuration::CHECKOUT_URL}?#{URI.encode_www_form(DineroMailCheckout::CheckoutData.validate(data))}"
      end
    end
  end
end
