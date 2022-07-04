//
//  UIImage+AMTExtensions.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

extension UIImage {

    // MARK: - Init Methods
    
    /// 占位图标：空心描边 圆角矩形
    static func amt_iconImage(size: Any?) -> UIImage? {
        return amt_image(color: AMTAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: AMTAppearance.imageBackgroundColor)
    }
    
    /// 占位图标：空心描边 圆角矩形
    static func amt_iconImage(color: UIColor?, size: Any?) -> UIImage? {
        return amt_image(color: AMTAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 选中态：带颜色的 描边圆角矩形
    static func amt_selectedIconImage(color: UIColor?, size: Any?) -> UIImage? {
        return amt_image(color: (color ?? AMTAppearance.imageBackgroundColor).withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 列表项：空心描边 圆角矩形
    static func amt_menuItemIconImage() -> UIImage? {
        return amt_image(color: AMTAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: AMTAppearance.menuItemIconImageSize, cornerRadius: nil, borderWidth: nil, borderColor: AMTAppearance.imageBackgroundColor)
    }
    
    /// 占位图标 - 列表项：空心描边 圆角矩形
    static func amt_menuItemIconImage(color: UIColor?) -> UIImage? {
        return amt_image(color: (color ?? AMTAppearance.imageBackgroundColor).withAlphaComponent(0.1), size: AMTAppearance.menuItemIconImageSize, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 列表项 - 右侧箭头：空心描边 圆角矩形
    static func amt_menuItemArrowImage() -> UIImage? {
        return amt_image(color: AMTAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: AMTAppearance.menuItemArrowImageSize, cornerRadius: nil, borderWidth: nil, borderColor: AMTAppearance.imageBackgroundColor)
    }

    /// 占位图片：实心圆角矩形
    static func amt_image(size: Any?) -> UIImage? {
        return amt_image(color: AMTAppearance.imageBackgroundColor, size: size, cornerRadius: nil, borderWidth: nil, borderColor: nil)
    }
    
    /// 占位图片：实心圆角矩形
    static func amt_image(color: UIColor?, size: Any?) -> UIImage? {
        return amt_image(color: color, size: size, cornerRadius: nil, borderWidth: nil, borderColor: nil)
    }
    
    /// 占位图片：随机头像
    static func amt_randomProfileImage() -> UIImage? {
        return amt_image(color: UIColor.amt_random(), size: 100, cornerRadius: nil, borderWidth: nil, borderColor: nil)
    }
    
    /// 占位图
    static func amt_image(color: UIColor?, size: Any?, cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?) -> UIImage? {
        let imageColor = color ?? AMTAppearance.imageBackgroundColor
        let imageSize: CGSize
        if size is CGSize {
            imageSize = size as! CGSize
        } else if size is CGFloat {
            imageSize = CGSize(width: size as! CGFloat, height: size as! CGFloat)
        } else if size is Double {
            imageSize = CGSize(width: size as! Double, height: size as! Double)
        } else if size is NSInteger || size is Int {
            imageSize = CGSize(width: size as! NSInteger, height: size as! NSInteger)
        } else if size is Int {
            imageSize = CGSize(width: size as! Int, height: size as! Int)
        } else {
            imageSize = CGSize(width: 1, height: 1)
        }
        let imageCornerRadius = cornerRadius ?? (max(imageSize.width, imageSize.height) >= 20 ? 5 : 3)
        let imageBorderWidth = borderWidth ?? 1 //(max(imageSize.width, imageSize.height) >= 20 ? 1.5 : 1)
        let imageBorderColor = borderColor ?? imageColor
        
        return UIImage(color: imageColor, size: imageSize)?.byRoundCornerRadius(imageCornerRadius, borderWidth: imageBorderWidth, borderColor: imageBorderColor)
    }
    
    // MARK: - Getters & Setters
        
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}
