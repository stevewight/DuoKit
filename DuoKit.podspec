Pod::Spec.new do |s|

  s.name         = "DuoKit"
  s.version      = "0.0.1"
  s.summary      = "Unofficial swift wrapper for the Duolingo API"
  s.homepage     = "https://github.com/stevewight/"
  s.license      = { :type => "MIT", :file => 'LICENSE' }
  s.author       = { "Steve Wight" => "stevendouglaswight@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source     = { :git => "https://github.com/stevewight/DuoKit.git", :tag => "0.0.1" }
  s.source_files = "DuoKit/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
  s.dependency "Alamofire", "~> 4.0"

end
