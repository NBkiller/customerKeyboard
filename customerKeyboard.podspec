Pod::Spec.new do |s|

s.name         = "customerKeyboard"
s.version      = "1.0.0"
s.ios.deployment_target = '7.0'
s.summary      = "A customerKeyboard for zhibaobao."
s.homepage     = "https://github.com/NBkiller/customerKeyboard"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "NB_killer" => "zhoupeng201004@sina.cn" }
s.source       = { :git => "https://github.com/NBkiller/customerKeyboard.git", :tag => s.version }
s.source_files = "customerKeyboard/customerKeyboard/customer/*.{h,m}"
s.resources    = "customerKeyboard/customerKeyboard/customer/images/*.png"
s.framework  = "UIKit"
s.requires_arc = true
s.dependency  = 'IQKeyboardManager'
end
