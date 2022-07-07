//
//  AMDarkModeViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import YYCategories
import MBProgressHUD
import AMKExtensions

class AMDarkModeViewController: AMStackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "暗夜模式适配"
        setupNavigationBar()
        test_dynamicColor()
        test_dynamicString()
        test_dynamicImage()
    }
    
    func setupNavigationBar() {
        var currentUserInterfaceStyleTitle: String {
            if #available(iOS 12.0, *) {
                return traitCollection.userInterfaceStyle == .light ? "Light" : "Dark"
            } else {
                return "暂不支持"
            }
        }
        
        navigationItem.rightBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "当前为\(currentUserInterfaceStyleTitle)", style: .plain, target: nil, action: nil)
            barButtonItem.actionBlock = { [unowned self] sender in
                if #available(iOS 13.0, *) {
                    overrideUserInterfaceStyle = traitCollection.userInterfaceStyle == .light ? .dark : .light
                    (sender as! UIBarButtonItem).title = "当前为\(currentUserInterfaceStyleTitle)"
                } else {
                    AMKELog.error("当前系统版本不支持该功能")
                }
            }
            return barButtonItem
        }()
    }
    
    // MARK: -
    
    func test_dynamicColor() {
        stackView.addArrangedSeparator(withTitle: "【直接判断】正常时 橘色，暗夜模式下红色：", color: view.tintColor, size: 13)
        stackView.addArrangedSubview({
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
            view.backgroundColor = {
                if #available(iOS 13.0, *) {
                    return UIColor { traitCollection in
                        return traitCollection.userInterfaceStyle == .light ? UIColor.orange : UIColor.red
                    }
                } else {
                    return UIColor.orange
                }
            }()
            return view
        }())
        
        stackView.addArrangedSeparator(withTitle: "【定义变量】正常时 橘色，暗夜模式下红色：", color: view.tintColor, size: 13)
        stackView.addArrangedSubview({
            let color: UIColor = {
                let colorInLight = UIColor.orange
                let colorInDark = UIColor.red
                
                if #available(iOS 13.0, *) {
                    return UIColor { traitCollection in return traitCollection.userInterfaceStyle == .light ? colorInLight : colorInDark }
                } else {
                    return colorInLight
                }
            }()
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
            view.backgroundColor = color
            return view
        }())
        
        stackView.addArrangedSeparator(withTitle: "【方法封装】正常时 橘色，暗夜模式下红色：", color: view.tintColor, size: 13)
        stackView.addArrangedSubview({
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
            view.backgroundColor = dynamicColor(inLight: UIColor.orange, inDark: UIColor.red)
            return view
        }())
    }
    
    func dynamicColor(inLight: UIColor?, inDark: UIColor? = nil) -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection in return (traitCollection.userInterfaceStyle == .light ? inLight : inDark) ?? UIColor() }
        } else {
            return inLight
        }
    }
        
    // MARK: -
    
    func test_dynamicString() {
        stackView.addArrangedSeparator(withTitle: "【封装】动态文字：(不支持)", color: view.tintColor, size: 13)
        stackView.addArrangedSubview({
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
            label.textAlignment = .center
            label.textColor = dynamicColor(inLight: UIColor.orange, inDark: UIColor.red)
            label.text = dynamicString(inLight: "当前为 .light", inDark: "当前为 .dark")
            return label
        }())
    }
    
    func dynamicString(inLight: String?, inDark: String? = nil) -> String? {
        if #available(iOS 13.0, *) {
            return traitCollection.userInterfaceStyle == .light ? inLight : inDark
        } else {
            return inLight
        }
    }
    
    // MARK: -
    
    func test_dynamicImage() {
        if #available(iOS 13.0, *) {
            stackView.addArrangedSeparator(withTitle: "【封装】动态图片：(不支持)", color: view.tintColor, size: 13)
            stackView.addArrangedSubview({
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
                imageView.contentMode = .scaleAspectFit
                imageView.image = dynamicImage(inLight: UIImage(systemName: "sun.max"), inDark: UIImage(systemName: "moon"))
                return imageView
            }())
        }
    }
    
    func dynamicImage(inLight: UIImage?, inDark: UIImage? = nil) -> UIImage? {
        if #available(iOS 13.0, *) {
            return traitCollection.userInterfaceStyle == .light ? inLight : inDark
        } else {
            return inLight
        }
    }
    
    // MARK: -



}
