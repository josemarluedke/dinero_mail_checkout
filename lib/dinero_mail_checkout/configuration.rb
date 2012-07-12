module DineroMailCheckout
  class Configuration
    attr_accessor :payment_url, :account_number, :password, :logo_url, :success_url, :error_url, :pay_methods, :currency
    PESO = 1
    DOLLAR = 2
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
