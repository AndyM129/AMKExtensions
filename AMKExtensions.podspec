#
# Be sure to run `pod lib lint AMKExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AMKExtensions'
    s.version          = '0.1.0'
    s.summary          = 'A set of useful swift extensions. '
    s.description      = 'A set of useful swift extensions. '
    s.homepage         = 'https://github.com/AndyM129/AMKExtensions'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andy Meng' => 'andy_m129@163.com' }
    s.source           = { :git => 'https://github.com/AndyM129/AMKExtensions.git', :tag => s.version.to_s }
    s.social_media_url = 'https://juejin.cn/user/2875978147966855'
    s.ios.deployment_target = '10.0'
    s.requires_arc = true
    s.default_subspec = 'DefaultSubspec'
    
    # 默认子组件
    s.subspec 'DefaultSubspec' do |defaultSubspec|
        defaultSubspec.dependency 'AMKExtensions/UIKit'
        defaultSubspec.dependency 'AMKExtensions/Foundation'
    end

    # ThirdPart 第三方库扩展
    s.subspec 'ThirdPart' do |thirdPart|
        # SwiftyBeaver 调试日志
        thirdPart.subspec 'SwiftyBeaver' do |swiftyBeaver|
            swiftyBeaver.source_files = 'AMKExtensions/Classes/ThirdPart/SwiftyBeaver/*.swift'
            swiftyBeaver.dependency 'SwiftyBeaver'
        end
    end
    
    # UIKit 通用扩展
    s.subspec 'UIKit' do |uiKit|
        # NSString 相关扩展
        uiKit.subspec 'UIColor' do |color|
            # 易用封装 相关
            color.subspec 'Handy' do |handy|
                handy.source_files = 'AMKExtensions/Classes/UIKit/UIColor/Handy/*.swift'
            end
        end
    end
    
    # Foundation 通用扩展
    s.subspec 'Foundation' do |foundation|
        # NSAttributedString 相关扩展
        foundation.subspec 'NSAttributedString' do |attributedString|
            # 易用封装 相关
            attributedString.subspec 'Handy' do |handy|
                handy.source_files = 'AMKExtensions/Classes/Foundation/NSAttributedString/Handy/*.swift'
            end
        end
        
        # NSString 相关扩展
        foundation.subspec 'String' do |string|
            # 易用封装 相关
            string.subspec 'Handy' do |handy|
                handy.source_files = 'AMKExtensions/Classes/Foundation/String/Handy/*.swift'
            end
        end
    end
end
