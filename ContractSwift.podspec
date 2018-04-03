Pod::Spec.new do |s|
  s.name         = "ContractSwift"
  s.version      = "0.0.1"
  s.summary      = "ContractSwift is a Ethereum Smart Contract struct file generater."
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/daisuke310vvv/ContractSwift.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "daisuke310vvv" => "daisuke.sato1991@gmail.com" }
  s.social_media_url   = "http://twitter.com/st_dsk"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "http://github.com/daisuke310vvv/ContractSwift.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
end
