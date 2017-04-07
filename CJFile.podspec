Pod::Spec.new do |s|
  s.name         = "CJFile"
  s.version      = "0.0.1"
  s.summary      = "文件管理器，同时包括数据库文件的管理以及一个更好的使用数据库的方法."
  s.homepage     = "https://github.com/dvlproad/CJDatabase"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "studyroad@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJDatabase.git", :tag => "CJFile_0.0.1" }
  #s.source_files  = "CJFile/*.{h,m}"
  #s.resources = "CJFile/{png}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  s.subspec 'CJFMDBFileManager' do |ss|
    ss.source_files = "CJFile/CJFMDBFileManager/**/*.{h,m}"
    ss.resources = "CJFile/CJFMDBFileManager/demofmdb.db"
    ss.dependency 'FMDB', '~> 2.6.2'
    ss.dependency 'CJFile/CJFileManager'
  end

  s.subspec 'CJFileManager' do |ss|
    ss.source_files = "CJFile/CJFileManager/**/*.{h,m}"
  end

  s.subspec 'CJFileModel' do |ss|
    ss.source_files = "CJFile/CJFileModel/**/*.{h,m}"
  end

end
