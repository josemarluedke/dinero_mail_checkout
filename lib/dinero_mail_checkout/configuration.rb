module DineroMailCheckout
  class Configuration
    attr_accessor :payment_url, :merchant, :logo_url, :success_url, :error_url, :payment_method, :currency
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
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
