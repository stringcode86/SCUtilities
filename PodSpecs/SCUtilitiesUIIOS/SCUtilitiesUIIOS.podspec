Pod::Spec.new do |s|
  s.name             = "SCUtilitiesUIIOS"
  s.version          = "0.1.4"
  s.summary          = "UIKit utility iOS framework written in Swift"
  s.description      = <<-DESC
UIKit convenience & utility iOS framework written in Swift
                       DESC

  s.homepage         = "https://github.com/stringcode86/SCUtilities"
  s.license          = { :type => 'MIT', :file => 'PodSpecs/SCUtilitiesUIIOS/LICENSE' }
  s.author           = { "@stringCode" => "michael@stringcode.co.uk" }
  s.source           = { :git => "https://github.com/stringcode86/SCUtilities.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stringcode'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'PodSpecs/SCUtilitiesUIIOS/Pod/Classes/**/*'
  s.resource_bundles = {
    'SCUtilitiesUIIOS' => ['PodSpecs/SCUtilitiesUIIOS/Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation'
  end
