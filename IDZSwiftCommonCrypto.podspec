#
#  Be sure to run `pod spec lint IDZSwiftCommonCrypto.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "IDZSwiftCommonCrypto"
  s.version      = "0.6.8"
  s.summary      = "A wrapper for Apple's Common Crypto library written in Swift."

  s.homepage     = "https://github.com/iosdevzone/IDZSwiftCommonCrypto"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "iOSDevZone" => "idz@iosdeveloperzone.com" }
  s.social_media_url   = "http://twitter.com/iOSDevZone"
 
  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source       = { :git => "https://github.com/iosdevzone/IDZSwiftCommonCrypto.git", :tag => s.version.to_s }


  s.prepare_command = <<-CMD
  
  touch prepare_command.txt
  echo 'Running prepare_command'
  pwd
  echo Running GenerateCommonCryptoModule
  swift ./GenerateCommonCryptoModule.swift macosx .
  swift ./GenerateCommonCryptoModule.swift iphonesimulator .
  swift ./GenerateCommonCryptoModule.swift iphoneos .
  swift ./GenerateCommonCryptoModule.swift appletvsimulator .
  swift ./GenerateCommonCryptoModule.swift appletvos .
  swift ./GenerateCommonCryptoModule.swift watchsimulator .
  swift ./GenerateCommonCryptoModule.swift watchos .

CMD
  s.source_files  = "IDZSwiftCommonCrypto"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  s.preserve_paths = "Frameworks"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  s.xcconfig = { 
  "SWIFT_INCLUDE_PATHS" => "$(PROJECT_DIR)/IDZSwiftCommonCrypto/Frameworks/$(PLATFORM_NAME)",
  "FRAMEWORK_SEARCH_PATHS" => "$(PROJECT_DIR)/IDZSwiftCommonCrypto/Frameworks/$(PLATFORM_NAME)"
  }
  # s.dependency "JSONKit", "~> 1.4"

end
