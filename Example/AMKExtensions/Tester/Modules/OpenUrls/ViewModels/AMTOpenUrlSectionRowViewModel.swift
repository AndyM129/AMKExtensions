//
//  AMTOpenUrlSectionRowViewModel.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTOpenUrlSectionRowViewModel: NSObject {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init(title: String?, exampleViewModels: [AMTOpenUrlExampleViewModel]?) {
        super.init()
        self.title = title
        self.exampleViewModels = exampleViewModels
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var exampleViewModels: [AMTOpenUrlExampleViewModel]?
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

}
