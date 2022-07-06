//
//  AMTOpenUrlSectionRow.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

/// 调起 APP - 一个分区
class AMTOpenUrlSectionRowModel: NSObject, HandyJSON {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {}
    
    init(title: String? = nil, detail: String? = nil, examples: [AMTOpenUrlExampleModel]? = nil) {
        super.init()
        self.title = title
        self.examples = examples
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var detail: String?
    
    var examples: [AMTOpenUrlExampleModel]?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
