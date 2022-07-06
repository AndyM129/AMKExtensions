//
//  AMTOpenUrlSection.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

class AMTOpenUrlSectionModel: NSObject, HandyJSON {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {}
    
    init(header: String? = nil, rows: [AMTOpenUrlSectionRowModel]? = nil) {
        super.init()
        self.header = header
        self.rows = rows
    }
    
    // MARK: - Getters & Setters
    
    var header: String?
    
    var rows: [AMTOpenUrlSectionRowModel]?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
