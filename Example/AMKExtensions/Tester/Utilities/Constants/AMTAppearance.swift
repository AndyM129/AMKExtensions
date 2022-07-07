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
    
    /// 主题色 - 未选中状态（浅灰色）
    static let unselectedTintColor: UIColor = UIColor(white: 0.2, alpha: 1)
    
    /// 主题色 - 选中状态（紫色）
    static let selectedTintColor: UIColor = tintColor
    
    /// 各种Bar 背景色（白色 & 黑色）
    static let barBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor.white, inDark: UIColor.black)!
    
    /// 页面背景色（浅白灰色 & 黑色）
    static let viewBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.95, alpha: 1), inDark: UIColor.black)!
    
    /// 内容背景色（白色 & 深黑灰色）
    static let contentBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor.white, inDark: UIColor(white: 0.1, alpha: 1))!
    
    /// 内容背景色 - 选中时（浅白灰色 & 浅黑灰色）
    static let contentSelectedBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.9, alpha: 1), inDark: UIColor(white: 0.15, alpha: 1))!

    /// 图片背景色（浅白灰色 & 浅黑灰色）
    static let imageBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.85, alpha: 1), inDark: UIColor(white: 0.2, alpha: 1))!
    
    /// 标题颜色（黑色 & 浅灰色）
    static let titleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor.black, inDark: UIColor(white: 0.8, alpha: 1))!
    
    /// 副标题颜色（黑灰色 & 白灰色）
    static let subtitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.6, alpha: 1), inDark: UIColor(white: 0.35, alpha: 1))!
    
    /// TabBarItem 角标颜色
    static let badgeColor: UIColor = UIColor(red:0.91, green:0.36, blue:0.35, alpha:1.00)
    
    // MARK: - Tab Bar
    
    /// TabBarItem 尺寸
    static let tabBarItemSize: CGSize = CGSize(width: 25, height: 25)
    
    /// TabBarItem 图标圆角大小
    static let tabBarItemCornerRadius: CGFloat = 4
    
    /// TabBarItem 角标颜色
    static let tabBarItemBadgeColor: UIColor = UIColor(red:0.91, green:0.36, blue:0.35, alpha:1.00)

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
    static let toastBackgroundColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0, alpha: 0.92), inDark: UIColor(white: 0.8, alpha: 0.92))!

    /// Toast 标题颜色（弱透明白色 & 弱透明浅白灰色）
    static let toastTitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.9, alpha: 1), inDark: UIColor(white: 0.1, alpha: 1))!

    /// Toast 副标题颜色（弱透明白色 & 弱透明浅白灰色）
    static let toastSubtitleColor: UIColor = UIColor.amke_dynamicProviderColor(inLight: UIColor(white: 0.7, alpha: 1), inDark: UIColor(white: 0.3, alpha: 1))!

}
