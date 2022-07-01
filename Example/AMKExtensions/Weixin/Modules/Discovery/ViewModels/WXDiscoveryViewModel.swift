//
//  WXDiscoveryViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 发现
class WXDiscoveryViewModel: NSObject {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    static func defaults() -> WXDiscoveryViewModel {
        var sections: [WXDiscoverySection] = []
        sections.append([
            WXDiscoveryItemViewModel(title: "朋友圈", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.52, green:0.81, blue:0.00, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXDiscoveryItemViewModel(title: "扫一扫", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.22, green:0.43, blue:0.90, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXDiscoveryItemViewModel(title: "看一看", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.94, green:0.73, blue:0.00, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXDiscoveryItemViewModel(title: "搜一搜", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.89, green:0.27, blue:0.22, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            WXDiscoveryItemViewModel(title: "小程序", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.36, green:0.22, blue:0.91, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        return WXDiscoveryViewModel(sections: sections)
    }
    
    init(sections: [WXDiscoverySection]?) {
        self.sections = sections ?? []
    }
    
    // MARK: - Getters & Setters
    
    var sections: [WXDiscoverySection] = []
        
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

}
