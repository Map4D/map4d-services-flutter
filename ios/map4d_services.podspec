Pod::Spec.new do |s|
  s.name             = 'map4d_services'
  s.version          = '1.0.0'
  s.summary          = 'Map4dServices for flutter.'
  s.description      = <<-DESC
A flutter plugin for integrating Map4D Services in iOS and Android applications.
                       DESC
  s.homepage         = 'https://map4d.vn'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'IOTLink' => 'admin@iotlink.com.vn' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '9.3'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency 'Flutter'
  s.dependency 'Map4dServices', '~> 2.0.0'
end
