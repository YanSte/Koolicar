# Version
platform :ios, '9.0'
use_frameworks!

# Pods project
def shared_pods
    pod 'Alamofire', '4.0.0'
    pod 'AlamofireImage', '3.0.0'
    pod 'ObjectMapper', '2.0.0'
    pod 'MXParallaxHeader', '0.5.2'
    pod 'ImageSlideshow',  :git => 'https://github.com/zvonicek/ImageSlideshow.git', :branch => 'swift-3'
    pod 'NVActivityIndicatorView', '3.0'
end

target 'koolicarproject' do
    shared_pods
end

target 'koolicarprojectTests' do
    shared_pods
end

target 'koolicarprojectUITests' do
    shared_pods
end

# Fixe Xcode 8 Beta 3 Use Legacy Swift issue
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
