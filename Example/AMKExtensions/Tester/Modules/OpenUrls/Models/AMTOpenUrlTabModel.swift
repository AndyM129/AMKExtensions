//
//  AMTOpenUrlTabModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import HandyJSON

class AMTOpenUrlTabModel: NSObject, HandyJSON {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    required override init() {}
    
    init(sections: [AMTOpenUrlSectionModel]?) {
        super.init()
        self.sections = sections
    }
    
    // MARK: - Getters & Setters
    
    var sections: [AMTOpenUrlSectionModel]?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

}
