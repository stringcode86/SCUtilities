Pod::Spec.new do |s|
s.name             = "SCUtilitiesCoreIOS"
s.version          = "0.1.0"
s.summary          = "Convenience & utility written in Swift"
s.description      = <<-DESC
Convenience & utility framework for iOS written in Swift
DESC

s.homepage         = "https://github.com/stringcode86/SCUtilities"
s.license          = 'MIT'
s.author           = { "stringcode" => "michael@stringcode.co.uk" }
s.source           = { :git => "https://github.com/stringcode86/SCUtilities.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/@stringcode'

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.resource_bundles = {
'SCUtilitiesCoreIOS' => ['Pod/Assets/*.png']
}

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'Foundation'
# s.dependency 'AFNetworking', '~> 2.3'
end