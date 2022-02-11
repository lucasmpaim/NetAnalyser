#
# Be sure to run `pod lib lint NetAnalyser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NetAnalyser'
  s.version          = '0.0.5'
  s.summary          = 'A simple network analyser for iOS based on Chunker and Alice'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A simple network analyser for iOS based on Chunker (Android) and Alice (Flutter)'

  s.homepage         = 'https://github.com/lucasmpaim/NetAnalyser'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lucasmpaim1@gmail.com' => 'lucasmpaim1@gmail.com' }
  s.source           = { :git => 'https://github.com/lucasmpaim/NetAnalyser.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  
  s.ios.deployment_target = '12.0'

  s.source_files = 'Sources/**/*.swift'
  
  # s.resource_bundles = {
  #   'NetAnalyser' => ['NetAnalyser/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
