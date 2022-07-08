//
//  AMTAppearance.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 主题风格
class AMTAppearance {
        
    // MARK: - Common UI
    
    /// 主题色（紫色）
    static let tintColor: UIColor = UIColor(red:0.46, green:0.45, blue:0.88, alpha:1.00)
    
    /// 主题色 - 未选中状态（黑色）
    static let unselectedTintColor: UIColor = UIColor(red:0.10, green:0.10, blue:0.11, alpha:1.00)
    
    /// 主题色 - 选中状态（紫色）
    static let selectedTintColor: UIColor = tintColor
    
    /// 各种Bar 背景色（灰色 & 黑色）
    static let barBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00), inDark: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1.00))!
    
    /// 页面背景色（浅白灰色 & 黑色）
    static let viewBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00), inDark: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1.00))!
    
    /// 内容背景色（白色 & 深黑灰色）
    static let contentBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00), inDark: UIColor(red:0.13, green:0.13, blue:0.13, alpha:1.00))!
    
    /// 内容背景色 - 选中时（浅白灰色 & 浅黑灰色）
    static let contentSelectedBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.00), inDark: UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.00))!

    /// 图片背景色（浅白灰色 & 浅黑灰色）
    static let imageBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00), inDark: UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00))!
    
    /// 标题颜色（黑色 & 浅灰色）
    static let titleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.00), inDark: UIColor(red:0.76, green:0.76, blue:0.76, alpha:1.00))!
    
    /// 副标题颜色（黑灰色 & 白灰色）
    static let subtitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.72, green:0.72, blue:0.72, alpha:1.00), inDark: UIColor(red:0.35, green:0.35, blue:0.35, alpha:1.00))!
    
    /// TabBarItem 角标颜色
    static let badgeColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.86, green:0.39, blue:0.37, alpha:1.00), inDark: UIColor(red:0.83, green:0.41, blue:0.35, alpha:1.00))!
    
    // MARK: - Tab Bar
    
    /// TabBarItem 尺寸
    static let tabBarItemSize: CGSize = CGSize(width: 25, height: 25)
    
    /// TabBarItem 图标圆角大小
    static let tabBarItemCornerRadius: CGFloat = 4
    
    // MARK: - Navigation Bar
    
    // MARK: - View
    
    /// TableView - section 间隔高度
    static let tableViewSectionIntervalHeight: CGFloat = 8
        
    /// 列表左侧的图标 尺寸
    static let menuItemIconImageSize = CGSize(width: 20, height: 20)
        
    /// 列表右侧的箭头图标 尺寸
    static let menuItemArrowImageSize = CGSize(width: 17, height: 17)
    
    // MARK: - Toast
    
    /// Toast 背景色（弱透明黑色 & 弱透明浅白灰色）
    static let toastBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:0.30, green:0.30, blue:0.30, alpha:1.00), inDark: UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.00))!

    /// Toast 标题颜色（弱透明白色 & 弱透明浅白灰色）
    static let toastTitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.00), inDark: UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.00))!

    /// Toast 副标题颜色（弱透明白色 & 弱透明浅白灰色）
    static let toastSubtitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.8), inDark: UIColor(red:0.85, green:0.85, blue:0.85, alpha:0.8))!

}
