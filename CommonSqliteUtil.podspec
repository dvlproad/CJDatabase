Pod::Spec.new do |s|
  s.name         = "CommonSqliteUtil"
  s.version      = "0.0.2"
  s.summary      = "easier to use Sqlite."
  s.homepage     = "https://github.com/dvlproad/CommonFMDBUtil"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "913168921@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CommonFMDBUtil.git", :tag => "0.0.2" }
  s.source_files  = "CommonSqliteUtil/*.{h,m}"
  s.resources = "CommonSqliteUtil/demosqlite.db"
  s.frameworks = 'UIKit'


  # s.library   = "iconv"
  s.libraries = "sqlite3"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  s.dependency 'FMDB', '~> 2.5'

end
