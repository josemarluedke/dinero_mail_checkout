# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dinero_mail_checkout/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josemar Davi Luedke"]
  gem.email         = ["josemarluedke@gmail.com"]
  gem.description   = %q{DineroMail checkout}
  gem.summary       = %q{DineroMail checkout}
  gem.homepage      = "http://github.com/josemarluedke/dinero_mail_checkout"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dinero_mail_checkout"
  gem.require_paths = ["lib"]
  gem.version       = DineroMailCheckout::VERSION

  gem.add_development_dependency "rspec"
end
