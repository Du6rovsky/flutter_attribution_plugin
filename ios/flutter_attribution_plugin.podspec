#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_attribution_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_attribution_plugin'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight Flutter plugin for accessing native mobile attribution data'
  s.description      = <<-DESC
Flutter plugin providing access to Apple Search Ads Attribution Token (iOS).
                       DESC
  s.homepage         = 'https://inphinit.space/flutter-attribution-plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'inphinit' => 'inphinit.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
