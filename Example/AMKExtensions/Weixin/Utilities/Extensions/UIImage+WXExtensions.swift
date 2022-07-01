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
    
    static func wx_image(color: UIColor, size: CGSize?, cornerRadius: CGFloat?, borderWidth: CGFloat?) -> UIImage? {
        let filledColor = borderWidth == nil ? color : UIColor.clear
        let borderColor = borderWidth == nil ? nil : color
        var image = UIImage(color: filledColor, size: size ?? CGSize(width: 1, height: 1))
        image = image?.byRoundCornerRadius(cornerRadius ?? 0, borderWidth: borderWidth ?? 0, borderColor: borderColor)
        return image
    }
    
    // MARK: - Getters & Setters
        
    // MARK: - Data & Networking
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
