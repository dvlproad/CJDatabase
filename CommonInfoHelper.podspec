Pod::Spec.new do |s|
  s.name         = "CommonInfoHelper"
  s.version      = "0.0.2"
  s.summary      = "一个Info结构体的帮助类"
  s.homepage     = "https://github.com/dvlproad/CommonFMDBUtil"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "913168921@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CommonFMDBUtil.git", :tag => "0.0.2" }
  s.source_files  = "CommonInfoHelper/*.{h,m}"
  # s.resources = "Resources/*.png"
  s.frameworks = 'UIKit'


  # s.library   = "iconv"
  # s.libraries = "sqlite3"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
