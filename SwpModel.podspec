#
#  Be sure to run `pod spec lint SwpModel.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name             = 'SwpModel'
  s.version          = '1.1.1'
  s.summary          = ' 数据模型工具 '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 数据模型工具
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpModel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpModel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = 'SwpModel/Class/**/*.{h,m}'
  s.resource      = 'SwpModel/Resources/SwpModel.bundle'
  s.framework     = 'Foundation'

  # s.resource_bundles = {
  #   'SwpModel' => ['SwpModel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
