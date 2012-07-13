module DineroMailCheckout

  class MissingItemNameError < StandardError ; end
  class MissingItemQuantityError < StandardError ; end
  class MissingItemAmmountError < StandardError ; end
  class MissingMerchantError < StandardError ; end
  class MissingCountryIdError < StandardError ; end

  class CheckoutData
    class << self
      def validate(attributes = {})
        attributes[:merchant] = (DineroMailCheckout.configuration.merchant || nil ) if attributes[:merchant].nil?
        raise(MissingMerchantError) if attributes[:merchant].nil?
        raise(MissingCountryIdError) if attributes[:country_id].nil?
        raise(MissingItemNameError) if attributes[:item_name_1].nil?
        raise(MissingItemQuantityError) if attributes[:item_quantity_1].nil?
        raise(MissingItemAmmountError) if attributes[:item_ammount_1].nil?
        attributes[:payment_method_available] = (DineroMailCheckout.configuration.payment_method || 'all' ) if attributes[:payment_method_available].nil?
        attributes[:ok_url] = DineroMailCheckout.configuration.success_url if attributes[:ok_url].nil?
        attributes[:error_url] = DineroMailCheckout.configuration.error_url if attributes[:error_url].nil?
        attributes[:currency] = DineroMailCheckout.configuration.currency if attributes[:currency].nil?
        attributes[:country_id] = DineroMailCheckout.configuration.currency if attributes[:country_id].nil?
        attributes
      end
    end
  end
end
