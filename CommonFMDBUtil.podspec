Pod::Spec.new do |s|
  s.name         = "CommonFMDBUtil"
  s.version      = "0.0.3"
  s.summary      = "easier to use FMDB."
  s.homepage     = "https://github.com/dvlproad/CommonFMDBUtil"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "studyroad@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CommonFMDBUtil.git", :tag => "CommonFMDBUtil_0.0.3" }
  s.source_files  = "CommonFMDBUtil/**/*.{h,m}"
  s.resources = "CommonFMDBUtil/demofmdb.db"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  s.dependency 'FMDB', '~> 2.5'

end
