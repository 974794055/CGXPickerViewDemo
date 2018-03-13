Pod::Spec.new do |s|
  s.name         = "CGXPickerView"    #存储库名称
  s.version      = "2.0.7"      #版本号，与tag值一致
  s.summary      = "a CGXPickerView demo标签封装"  #简介
  s.description  = "a CGXPickerView标签封装"  #描述
  s.homepage     = "https://github.com/974794055/CGXPickerViewDemo"      #项目主页，不是git地址
  s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
  s.author             = { "974794055" => "974794055@qq.com" }  #作者
  s.platform     = :ios, "7.0"                  #支持的平台和版本号
  s.source       = { :git => "https://github.com/974794055/CGXPickerViewDemo.git", :tag =>        s.version }         #存储库的git地址，以及tag值
  s.source_files  =  "CGXPickerView/CGXPickerView","CGXPickerView/**/*" #需要托管的源代码路径
  s.resources    = 'CGXPickerView/CGXPickerView.bundle'
  s.requires_arc = true #是否支持ARC
end

