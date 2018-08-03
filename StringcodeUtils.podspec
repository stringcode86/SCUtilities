Pod::Spec.new do |s|
  s.name             = "StringcodeUtils"
<<<<<<< Updated upstream
  s.version          = "0.1.0"
=======
  s.version          = "0.2.0"
>>>>>>> Stashed changes
  s.summary          = "Convenience, utility framework for iOS, watchOS, tvOS, OSX written in Swift."
  s.description      = <<-DESC
                        Convenience, utility framework for iOS, watchOS, tvOS, OSX written in Swift. Right now in very rought state. I supose of very little value to anyone apart from me for now
                       DESC

  s.homepage         = "https://github.com/stringcode86/SCUtilities"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "stringcode" => "michael@stringcode.co.uk" }
  s.source           = { :git => "https://github.com/stringcode86/StringcodeUtils.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stringcode'

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"
  s.watchos.deployment_target = "2.0"

  s.subspec "Core" do |sp|
    sp.source_files  = "Classes/Core/*.{swift}"
  end

  # s.subspec "UI" do |sp|
  #   sp.source_files = "ClassesUI/*.{swift}"
  #   sp.dependency 'StringcodeUtils/Core'
  # end

end
