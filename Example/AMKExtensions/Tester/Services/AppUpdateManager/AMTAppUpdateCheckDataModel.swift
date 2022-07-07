//
//  AMTAppUpdateCheckDataModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

/// APP 更新 - 检测最新版本 - APP信息
class AMTAppUpdateCheckDataModel: NSObject, HandyJSON {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {
        super.init()
    }
    
    // MARK: - Getters & Setters
    
    var appKey: String?
    var buildBuildVersion: String?
    var buildFileKey: String?
    var buildFileSize: String?
    var buildHaveNewVersion: Bool?
    var buildIcon: String?
    var buildKey: String?
    var buildName: String?
    var buildShortcutUrl: String?
    var buildUpdateDescription: String?
    var buildVersion: String?
    var buildVersionNo: String?
    var downloadURL: String?
    var forceUpdateVersion: String?
    var forceUpdateVersionNo: String?
    var needForceUpdate: Bool?
    
    /// 数据是否是有效的
    var isValid: Bool {
        if appKey == nil { return false }
        if buildBuildVersion == nil { return false }
        if buildFileKey == nil { return false }
        if buildFileSize == nil { return false }
        if buildHaveNewVersion == nil { return false }
        if buildIcon == nil { return false }
        if buildKey == nil { return false }
        if buildName == nil { return false }
        if buildShortcutUrl == nil { return false }
        if buildUpdateDescription == nil { return false }
        if buildVersion == nil { return false }
        if buildVersionNo == nil { return false }
        if downloadURL == nil { return false }
        if forceUpdateVersion == nil { return false }
        if forceUpdateVersionNo == nil { return false }
        if needForceUpdate == nil { return false }
        return true
    }
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}
