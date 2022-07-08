//
//  AMTConstants.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 全局常量
class AMTConstants {
    
    /// MTJ AppKey
#if DEBUG
    static let mtjAppKey: String = "" // 开发模式下不上报
#else
    static let mtjAppKey: String = ""
#endif
    
    /// 云控配置地址
    static let configManagerUrlString: String = "https://www.fastmock.site/mock/918edb52006d5f75261f317f3ba37180/tester/data"
    
    /// APP更新管理
    static let pgyerApiKey: String = ""
    static let pgyerAppKey: String = ""
    static let pgyerAppShortcut: String = ""
    
    /// 1像素
    static let onePixel: CGFloat = 1.0 / UIScreen.main.scale
    
    /// UserDefaultsKey: APP 配置
    static let testerConfigUserDefaultsKey = "com.github.andym129.tester.userDefaults.key.testerConfig"
    
    /// UserDefaultsKey: FLEX 开关
    static let flexSwitchUserDefaultsKey = "com.github.andym129.tester.userDefaults.key.flex"

}
