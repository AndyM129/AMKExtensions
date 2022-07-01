//
//  WXMeViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 我
class WXMeViewModel: NSObject {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    static func defaults() -> WXMeViewModel {
        var sections: [WXMeSection] = []
        sections.append([
            WXMeInfoItemViewModel(title: nil, iconImage: nil, clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXMeItemViewModel(title: "服务", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.31, green:0.77, blue:0.49, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXMeItemViewModel(title: "收藏", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.89, green:0.36, blue:0.35, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXMeItemViewModel(title: "朋友圈", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.39, green:0.51, blue:0.91, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXMeItemViewModel(title: "卡包", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.36, green:0.22, blue:0.91, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXMeItemViewModel(title: "表情", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.95, green:0.78, blue:0.29, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXMeItemViewModel(title: "设置", iconImage: WXAppearance.menuItemIconImage(color: UIColor(red:0.16, green:0.40, blue:0.90, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        return WXMeViewModel(sections: sections)
    }
    
    init(sections: [WXMeSection]?) {
        self.sections = sections ?? []
    }
    
    // MARK: - Getters & Setters
    
    var sections: [WXMeSection] = []
        
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

}
