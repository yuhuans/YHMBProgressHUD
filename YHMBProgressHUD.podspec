Pod::Spec.new do |s|

s.name         = "YHMBProgressHUD"
s.version      = "1.0"
s.summary      = "MBProgressHUD"
s.description  = <<-DESC
基于MBProgrssHUD再次封装
DESC
s.homepage     = "https://github.com/yuhuans/YHMBProgressHUD"
s.license      = "MIT"
s.author             = { "yuhuanwater" => "260647768@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/yuhuans/YHMBProgressHUD.git", :tag => "#{s.version}" }
s.source_files  =  "YHMBProgressHUD/YHMBProgressHUD/HUD/*.{h,m}"
s.dependency "YHMBProgressHUD"
end
