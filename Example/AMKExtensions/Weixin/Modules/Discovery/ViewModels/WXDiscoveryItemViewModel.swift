//
//  WXDiscoveryItemViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

typealias WXDiscoveryItemViewModelClickedBlock = (_ viewModel: WXDiscoveryItemViewModel)->Void

typealias WXDiscoverySection = [WXDiscoveryItemViewModel]

/// 发现 - item
class WXDiscoveryItemViewModel: NSObject {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init(title: String?, iconImage: UIImage?, clickedBlock: WXDiscoveryItemViewModelClickedBlock?) {
        self.title = title
        self.iconImage = iconImage ?? WXAppearance.menuItemIconImage(color: WXAppearance.imageBackgroundColor)
        self.clickedBlock = clickedBlock
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var iconImage: UIImage?
    
    var clickedBlock: WXDiscoveryItemViewModelClickedBlock?
    
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
        
}
