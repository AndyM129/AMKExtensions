//
//  UIColor+AMKEHandy.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//

import UIKit

public extension UIColor {
    
    // MARK: - Init Methods

    /// 很据「当前是否启用暗夜模式」返回动态颜色
    static func amke_dynamicProviderColor(inLight: UIColor?, inDark: UIColor? = nil) -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? inLight : inDark) ?? UIColor() }
        } else {
            return inLight
        }
    }
    
    // MARK: - Getters & Setters
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}
