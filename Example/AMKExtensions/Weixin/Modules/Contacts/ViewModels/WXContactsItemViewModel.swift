//
//  WXContactsItemViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

typealias WXContactsItemViewModelClickedBlock = (_ viewModel: WXContactsItemViewModel)->Void

typealias WXContactsSection = [WXContactsItemViewModel]

/// 通讯录 - item
class WXContactsItemViewModel: NSObject {
    
    // MARK: - Deinit Contactsthods
    
    deinit {
        
    }
    
    // MARK: - Init Contactsthods
    
    init(title: String?, iconImage: UIImage?, clickedBlock: WXContactsItemViewModelClickedBlock?) {
        self.title = title
        self.iconImage = iconImage ?? UIImage.wx_menuItemIconImage()
        self.clickedBlock = clickedBlock
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var iconImage: UIImage?
    
    var clickedBlock: WXContactsItemViewModelClickedBlock?
    
    // MARK: - Data & Networking
    
    // MARK: - Public Contactsthods
    
    // MARK: - Private Contactsthods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Contactsthods
        
}
