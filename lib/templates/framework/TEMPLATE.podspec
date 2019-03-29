#
# Be sure to run `pod lib lint TEMPLATE.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TEMPLATE'
  s.version          = '1.0.0'
  s.summary          = 'TEMPLATE'
  s.swift_version    = "4.2"

  s.description      = 'TEMPLATE'

  s.homepage         = 'https://github.com/applidium/TEMPLATE'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  # s.author           = { 'TEMPLATE' => 'TEMPLATE@fabernovel.com' }
  s.source           = { :git => 'https://github.com/applidium/TEMPLATE.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/Classes/**/*'
end
