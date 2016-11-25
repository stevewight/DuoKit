#
#  Be sure to run `pod spec lint DuoKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DuoKit"
  s.version      = "0.0.1"
  s.summary      = "Unofficial swift wrapper for the Duolingo API"
  s.homepage     = "https://github.com/stevewight/"
  s.license      = { :type => "MIT" }
  s.author       = { "Steve Wight" => "stevendouglaswight@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source     = { :git => "https://github.com/stevewight/DuoKit.git" }
  s.source_files = "DuoKit", "DuoKit/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }
  s.dependency "Alamofire", "~> 4.0"

end
