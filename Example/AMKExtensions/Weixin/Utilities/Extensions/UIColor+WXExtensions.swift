//
//  UIColor+WXExtensions.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 色库，多用于随机色
    static let wx_colors: [UIColor] = [
        // 黄
        UIColor(red:0.94, green:0.82, blue:0.54, alpha:1.00),
        UIColor(red:0.91, green:0.72, blue:0.25, alpha:1.00),
        UIColor(red:0.91, green:0.59, blue:0.24, alpha:1.00),
        //UIColor(red:0.82, green:0.55, blue:0.18, alpha:1.00),
        
        // 红
        UIColor(red:0.93, green:0.75, blue:0.54, alpha:1.00),
        UIColor(red:0.82, green:0.32, blue:0.22, alpha:1.00),
        UIColor(red:0.84, green:0.24, blue:0.10, alpha:1.00),
        //UIColor(red:0.63, green:0.15, blue:0.23, alpha:1.00),
        
        // 蓝
        UIColor(red:0.42, green:0.47, blue:0.76, alpha:1.00),
        UIColor(red:0.32, green:0.34, blue:0.69, alpha:1.00),
        UIColor(red:0.18, green:0.15, blue:0.55, alpha:1.00),
        //UIColor(red:0.11, green:0.10, blue:0.33, alpha:1.00),
        
        // 绿
        UIColor(red:0.70, green:0.91, blue:0.56, alpha:1.00),
        UIColor(red:0.49, green:0.86, blue:0.53, alpha:1.00),
        UIColor(red:0.31, green:0.63, blue:0.62, alpha:1.00),
        //UIColor(red:0.22, green:0.55, blue:0.53, alpha:1.00),
        
        // UIColor(red:0.94, green:0.63, blue:0.47, alpha:1.00),
        // UIColor(red:0.36, green:0.75, blue:0.95, alpha:1.00),
        // UIColor(red:0.85, green:0.70, blue:0.27, alpha:1.00),
        // UIColor(red:0.42, green:0.88, blue:0.73, alpha:1.00),
        // UIColor(red:0.77, green:0.80, blue:0.76, alpha:1.00),
        // UIColor(red:0.91, green:0.49, blue:0.30, alpha:1.00),
        // UIColor(red:0.32, green:0.53, blue:0.97, alpha:1.00),
        // UIColor(red:0.95, green:0.94, blue:0.71, alpha:1.00),
        // UIColor(red:0.37, green:0.65, blue:0.58, alpha:1.00),
        // UIColor(red:0.16, green:0.20, blue:0.24, alpha:1.00),
        // UIColor(red:0.62, green:0.21, blue:0.40, alpha:1.00),
        // UIColor(red:0.24, green:0.16, blue:0.54, alpha:1.00),
        // UIColor(red:0.92, green:0.44, blue:0.41, alpha:1.00),
        // UIColor(red:0.62, green:0.91, blue:0.84, alpha:1.00),
        // UIColor(red:0.80, green:0.58, blue:0.89, alpha:1.00),
        // UIColor(red:0.36, green:0.13, blue:0.27, alpha:1.00),
        // UIColor(red:0.92, green:0.28, blue:0.44, alpha:1.00),
        // UIColor(red:0.70, green:0.75, blue:0.48, alpha:1.00),
        // UIColor(red:0.46, green:0.29, blue:0.57, alpha:1.00),
        // UIColor(red:0.86, green:0.32, blue:0.24, alpha:1.00)
    ]
    
    /// 从色库 随机取一个颜色
    static func wx_random() -> UIColor {
        return wx_colors[Int.random(in: 0..<wx_colors.count)]
    }
    
}
