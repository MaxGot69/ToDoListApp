platform :ios, '16.6'

use_frameworks!
use_modular_headers!

target 'TodoList' do
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.6'
        config.build_settings['CLANG_CXX_LANGUAGE_STANDARD'] = 'c++17'
config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
        config.build_settings['OTHER_CPLUSPLUSFLAGS'] = '-Wno-error=unsupported-target-opt'
      end
    end
  end
end
