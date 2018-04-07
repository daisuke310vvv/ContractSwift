Pod::Spec.new do |s|
  s.name          = "ContractSwift"
  s.version       = "0.2.1"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.homepage      = "https://github.com/daisuke310vvv/ContractSwift"
  s.author        = { "daisuke310vvv" => "daisuke.sato1991@gmail.com" }
  s.summary       = "ContractSwift is a Ethereum Smart Contract struct file generater."
  s.source        = { :http => "#{s.homepage}/releases/download/#{s.version}/contractswift.zip", :flatten => true }
  s.platform      = :ios, "10.0"
  s.swift_version = "4.1"

  s.requires_arc   = true
  s.preserve_paths = "*"

  s.social_media_url = "http://twitter.com/st_dsk"

  s.dependency "ContractSwift.Library"
end
