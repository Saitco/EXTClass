#
# Be sure to run `pod lib lint EXTClass.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EXTClass'
  s.version          = '0.3.3'
  s.summary          = 'EXTClass contiene extensiones utiles.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
EXTClass contiene extensiones utiles y otras cosas.
                       DESC

  s.homepage         = 'https://github.com/Saitco/EXTClass'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matias Correnti' => 'saitco.pro@gmail.com' }
  s.source           = { :git => 'https://github.com/Saitco/EXTClass.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.3'

  s.source_files = 'EXTClass/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EXTClass' => ['EXTClass/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation', 'CoreLocation', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.libraries = 'xml2'
  s.xcconfig = {
  'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'
  }
end
