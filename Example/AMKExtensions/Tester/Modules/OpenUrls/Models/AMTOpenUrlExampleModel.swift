//
//  AMTOpenUrlExample.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import Foundation
import HandyJSON

/// 调起APP - 例子
class AMTOpenUrlExampleModel: NSObject, HandyJSON {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {}
    
    init(title: String? = nil, router: String? = nil, pasteboard: String? = nil) {
        super.init()
        self.title = title
        self.router = router
        self.pasteboard = pasteboard
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var router: String?
    
    var pasteboard: String?
    
    var detailText: String? {
        var strings: [String] = []

        // 路由
        if let router = router {
            strings.append("[路由] \(router)")
        }
        
        // 剪贴板内容
        if var pasteboard = pasteboard {
            let maxLength = 120
            if pasteboard.count > maxLength {
                let startIndex = pasteboard.startIndex
                let endIndex = pasteboard.index(startIndex, offsetBy: maxLength)
                pasteboard = String(pasteboard[startIndex..<endIndex]) + "...（已省略 \(pasteboard.count - maxLength) / \(pasteboard.count) 字）"
            }
            strings.append("[剪贴板] \(pasteboard)")
        }
        
        return (strings.isEmpty ? "" : "\n") + strings.joined(separator: "\n\n")
    }
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}
