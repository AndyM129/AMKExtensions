//
//  AMTOpenUrlExampleViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTOpenUrlExampleViewModel: NSObject {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init(title: String?, router: String?, pasteboard: String?) {
        super.init()
        self.title = title
        self.router = router
        self.pasteboard = pasteboard
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var router: String?
    
    var pasteboard: String?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
