//
//  UIImage+WXExtensions.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

extension UIImage {

    // MARK: - Init Methods
    
    /// 占位图标：空心描边 圆角矩形
    static func wx_iconImage(size: Any?) -> UIImage? {
        return wx_image(color: WXAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: WXAppearance.imageBackgroundColor)
    }
    
    /// 占位图标：空心描边 圆角矩形
    static func wx_iconImage(color: UIColor?, size: Any?) -> UIImage? {
        return wx_image(color: WXAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 选中态：带颜色的 描边圆角矩形
    static func wx_selectedIconImage(color: UIColor?, size: Any?) -> UIImage? {
        return wx_image(color: (color ?? WXAppearance.imageBackgroundColor).withAlphaComponent(0.1), size: size, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 列表项：空心描边 圆角矩形
    static func wx_menuItemIconImage() -> UIImage? {
        return wx_image(color: WXAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: WXAppearance.menuItemIconImageSize, cornerRadius: nil, borderWidth: nil, borderColor: WXAppearance.imageBackgroundColor)
    }
    
    /// 占位图标 - 列表项：空心描边 圆角矩形
    static func wx_menuItemIconImage(color: UIColor?) -> UIImage? {
        return wx_image(color: (color ?? WXAppearance.imageBackgroundColor).withAlphaComponent(0.1), size: WXAppearance.menuItemIconImageSize, cornerRadius: nil, borderWidth: nil, borderColor: color)
    }
    
    /// 占位图标 - 列表项 - 右侧箭头：空心描边 圆角矩形
    static func wx_menuItemArrowImage() -> UIImage? {
        return wx_image(color: WXAppearance.imageBackgroundColor.withAlphaComponent(0.1), size: WXAppearance.menuItemArrowImageSize, cornerRadius: nil, borderWidth: nil, borderColor: WXAppearance.imageBackgroundColor)
    }

    /// 占位图片：实心圆角矩形
    static func wx_image(size: Any?) -> UIImage? {
        return wx_image(color: WXAppearance.imageBackgroundColor, size: size, cornerRadius: nil, borderWidth: nil, borderColor: nil)
    }
    
    /// 占位图片：实心圆角矩形
    static func wx_image(color: UIColor?, size: Any?) -> UIImage? {
        return wx_image(color: color, size: size, cornerRadius: nil, borderWidth: nil, borderColor: nil)
    }
    
    /// 占位图
    static func wx_image(color: UIColor?, size: Any?, cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?) -> UIImage? {
        let imageColor = color ?? WXAppearance.imageBackgroundColor
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
