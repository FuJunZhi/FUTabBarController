Pod::Spec.new do |s|
    s.name         = "FUTabBarController"
    s.version      = "2.0.1"
    s.summary      = "custom FUTabBar"
    s.homepage     = "https://github.com/FuJunZhi/FUTabBarController"
    s.license      = "MIT"
    s.authors      = {"FuJunZhi" => "fujunzhi1007@163.com"}
    s.platform     = :ios, "7.0"
    s.source       = {:git => "https://github.com/FuJunZhi/FUTabBarController.git", :tag => s.version}
    s.source_files = "FUTabBarController/*.{h,m}"
    s.dependency 'SDWebImage'
    s.requires_arc = true
end