platform :ios, '15'

target 'testBdjobs' do
  use_frameworks!
  use_modular_headers!

  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireImage', '~> 3.3'
  pod 'FSPagerView'
  pod 'SQLite.swift', '~> 0.12.2'
  pod 'WSTagsField'
  pod 'Toast-Swift'

end

post_install do |installer|
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

