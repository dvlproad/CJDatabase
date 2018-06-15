Pod::Spec.new do |s|
  s.name         = "CJFile"
  s.version      = "0.0.9"
  s.summary      = "文件操作的库(数据的缓存放在了CJNetwork/CJCacheManager)"
  s.homepage     = "https://github.com/dvlproad/CJDatabase"

  s.description  = <<-DESC
                  *、CJFMDBFileManager：一个不仅可以方便的操作数据库文件中的内容（增删改查），还可以方便的操作数据库文件（如创建、删除、重建）的库。

                   A longer description of CJPopupAction in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.license      = "MIT"
  s.author             = { "dvlproad" => "studyroad@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJDatabase.git", :tag => "CJFile_0.0.9" }
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

    ss.dependency 'FMDB'
    ss.dependency 'CJFile/CJFileManager'
  end

  s.subspec 'CJFileManager' do |ss|
    ss.source_files = "CJFile/CJFileManager/**/*.{h,m}"
  end

  s.subspec 'CJFileModel' do |ss|
    ss.source_files = "CJFile/CJFileModel/**/*.{h,m}"
  end


end
