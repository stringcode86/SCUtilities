Pod::Spec.new do |s|
s.name             = "SCUtilitiesCoreIOS"
s.version          = "0.1.6"
s.summary          = "Foundation utility iOS framework written in Swift"
s.description      = <<-DESC
Foundation convenience & utility iOS framework written in Swift
DESC

s.homepage         = "https://github.com/stringcode86/SCUtilities"
s.license          = { :type => 'MIT', :file => 'PodSpecs/SCUtilitiesCoreIOS/LICENSE' }
s.author           = { "stringcode" => "michael@stringcode.co.uk" }
s.source           = { :git => "https://github.com/stringcode86/SCUtilities.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/stringcode'


s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'SCUtilitiesCore/**/*'

s.frameworks = 'Foundation'
end