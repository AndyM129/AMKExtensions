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
    
    /// 主题色 - 默认状态
    static let normalTintColor: UIColor = UIColor(white: 0.2, alpha: 1)
    
    /// 主题色 - 选中状态
    static let selectedTintColor: UIColor = UIColor(red:0.49, green:0.48, blue:0.87, alpha:1.00)
    
    /// 页面背景色
    static let viewBackgroundColor: UIColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.00)
    
    /// 图片背景色
    static let imageBackgroundColor: UIColor = UIColor.lightGray
    
    // MARK: - Tab Bar
    
    /// TabBar 背景色
    static let tabBarBackgroundColor :UIColor = UIColor.white
    
    /// TabBarItem 尺寸
    static let tabBarItemSize: CGSize = CGSize(width: 25, height: 25)
    
    /// TabBarItem 图标圆角大小
    static let tabBarItemCornerRadius: CGFloat = 4
    
    /// TabBarItem 角标颜色
    static let tabBarItemBadgeColor: UIColor = UIColor(red:0.91, green:0.36, blue:0.35, alpha:1.00)

    // MARK: - Navigation Bar

    /// Navigation Bar 背景色
    static let navigationBarBackgroundColor: UIColor = tabBarBackgroundColor
    
    /// Navigation Bar 按钮
    static let navigationBarTintColor: UIColor = selectedTintColor
    
    // MARK: - View
    
    /// TableView - section 间隔高度
    static let tableViewSectionIntervalHeight: CGFloat = 8
    
    /// TableViewCell - 选中时的背景色
    static let tableViewCellSelectedBackgroundColor: UIColor = UIColor(white: 0, alpha: 0.1)
    
    /// 列表左侧的图标 尺寸
    static let menuItemIconImageSize = CGSize(width: 20, height: 20)
        
    /// 列表右侧的箭头图标 尺寸
    static let menuItemArrowImageSize = CGSize(width: 17, height: 17)
    
}
