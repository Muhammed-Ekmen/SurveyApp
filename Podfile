# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
  use_frameworks!
  pod "TinyConstraints"
  pod 'lottie-ios'
  pod 'SwiftEntryKit'
end

workspace 'SurveyApp'

target 'SurveyApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SurveyApp
	pod 'IQKeyboardManagerSwift'
	shared_pods
end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  shared_pods
  
  # Generater
  pod 'SwiftGen', '~> 6.5.1'

end

# post install
post_install do |installer|
  # fix xcode 15 DT_TOOLCHAIN_DIR - remove after fix oficially - https://github.com/CocoaPods/CocoaPods/issues/12065
  installer.aggregate_targets.each do |target|
      target.xcconfigs.each do |variant, xcconfig|
      xcconfig_path = target.client_root + target.xcconfig_relative_path(variant)
      IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
      end
  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
          xcconfig_path = config.base_configuration_reference.real_path
          IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
      end
    end
  end
end