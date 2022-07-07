//
//  AMTAppUpdateNetworkModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

/// APP 更新 - 检测最新版本
class AMTAppUpdateCheckModel: NSObject, HandyJSON {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {
        super.init()
    }
    
    // MARK: - Getters & Setters
    
    var code: Int?
    var message: String?
    var data: AMTAppUpdateCheckDataModel?
    
    /// 数据是否是有效的
    var isValid: Bool {
        if code == nil { return false }
        if message == nil { return false }
        if data == nil { return false }
        if data!.isValid == false { return false }
        return true
    }
    
    // MARK: - Data & Networking
        
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}
