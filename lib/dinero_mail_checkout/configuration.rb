module DineroMailCheckout
  class Configuration
    attr_accessor :payment_url, :merchant, :logo_url, :success_url, :error_url, :payment_method, :currency, :country_id
    CHECKOUT_URL = "https://checkout.dineromail.com/CheckOut"

    class Currency
      ARS = "ars"
      MXN = "mxn"
      CLP = "clp"
      BRL = "brl"
      USD = "usd"
    end
  end

  class << self
    attr_accessor :configuration

    def get_country_name_by_id(id)
      case id
        when 1 then "argentina"
        when 2 then "brasil"
        when 3 then "chile"
        when 4 then "mexico"
      end
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
