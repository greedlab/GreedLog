Pod::Spec.new do |s|

  s.name         = "GreedLog"
  s.version      = "0.0.4"
  s.summary      = "log for iOS"
  s.description  = %{log more info for iOS }
  s.homepage     = "https://github.com/greedlab/GreedLog"
  s.license      = "MIT"
  s.author       = { "Bell" => "bell@greedlab.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/greedlab/GreedLog.git", :tag => s.version }
  s.source_files  = "GreedLog", "GreedLog/*.{h,m}"
  s.framework  = "Foundation"
  s.requires_arc = true

end
