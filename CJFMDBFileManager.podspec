Pod::Spec.new do |s|
  s.name         = "CJFMDBFileManager"
  s.version      = "1.1.2"
  s.summary      = "一个FMDB数据库文件的管理和使用.在这里停止使用改为pod‘CJFile’"
  s.homepage     = "https://github.com/dvlproad/CJDatabase"
  s.license      = "MIT"
  s.author             = { "dvlproad" => "studyroad@qq.com" }
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJDatabase.git", :tag => "CJFile_0.0.1" }
  s.source_files  = "CJFile/CJFileModel/*.{h,m}"
  #s.resources = "CJFile/{png}"
  s.frameworks = 'UIKit'

  s.deprecated = true

end
