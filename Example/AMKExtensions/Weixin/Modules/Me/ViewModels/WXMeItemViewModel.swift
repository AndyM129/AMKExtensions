//
//  WXMeItemViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

typealias WXMeItemViewModelClickedBlock = (_ viewModel: WXMeItemViewModel)->Void

typealias WXMeSection = [WXMeItemViewModel]

/// 发现 - item
class WXMeItemViewModel: NSObject {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init(title: String?, iconImage: UIImage?, clickedBlock: WXMeItemViewModelClickedBlock?) {
        self.title = title
        self.iconImage = iconImage ?? WXMeItemViewModel.iconImage(withColor: WXAppearance.imageBackgroundColor)
        self.clickedBlock = clickedBlock
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var iconImage: UIImage?
    
    var clickedBlock: WXMeItemViewModelClickedBlock?
    
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
    static func iconImage(withColor color: UIColor?) -> UIImage? {
        return UIImage(color: color ?? WXAppearance.imageBackgroundColor, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3)
    }
    
}
