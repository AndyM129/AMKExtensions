//
//  AMTTesterConfigNetworkModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

class AMTTesterConfigNetworkModel: NSObject, HandyJSON {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {
        super.init()
    }
    
    // MARK: - Getters & Setters

    var status: AMTNetworkStatusModel?

    var data: AMTTesterConfigDataModel?
    
    // MARK: - Data & Networking
    
    func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.data <-- "data.form_data"
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

}
