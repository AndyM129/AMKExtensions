//
//  AMTNetworkStatusModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

class AMTNetworkStatusModel: NSObject, HandyJSON {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {}
    
    init(code: Int?, msg: String?) {
        super.init()
        self.code = code
        self.msg = msg
    }
    
    // MARK: - Getters & Setters
    
    var code: Int?
    
    var msg: String?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
