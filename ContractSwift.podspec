Pod::Spec.new do |s|
  s.name         = "ContractSwift"
  s.version      = "0.1.0"
  s.summary      = "ContractSwift is a Ethereum Smart Contract struct file generater."
  s.homepage     = "https://github.com/daisuke310vvv/ContractSwift.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "daisuke310vvv" => "daisuke.sato1991@gmail.com" }
  s.social_media_url   = "http://twitter.com/st_dsk"
  s.platform     = :ios, "10.0"
  s.swift_version = "4.1"
  s.source       = { :http => "#{s.homepage}/releases/download/#{s.version}/contractswift-#{s.version}.zip" }
  s.requires_arc = true
end
