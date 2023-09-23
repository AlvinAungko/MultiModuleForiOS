# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
use_frameworks!

workspace 'MultiModuleRefactor.xcworkspace'
project 'MultiModuleRefactor.xcodeproj', {
  'Debug' => :debug,
  'Release' => :release,
}

def share_pods

  # Networking
  pod 'Alamofire'
  
end

target 'MultiModuleRefactor' do
  share_pods
end

target 'Networking' do
  project 'Frameworks/Networking/Networking.project'
  share_pods
end

target 'Utilities' do
  project 'Frameworks/Utilities/Utilities.project'
  share_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
