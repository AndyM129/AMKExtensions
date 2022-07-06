//
//  MBProgressHUD+AMTExtensions.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import Foundation
import MBProgressHUD
import AMKExtensions

extension MBProgressHUD {
        
    // MARK: - Init Methods

    // MARK: - Getters & Setters
    
    // MARK: - Data & Networking
    
    // MARK: - Action Methods
    
    @discardableResult
    static func amt_showHUD(mode: MBProgressHUDMode? = nil, text: String? = nil, details: String? = nil, duration: TimeInterval? = nil, in superview: UIView? = nil, context: Any? = nil) -> MBProgressHUD {
        AMKELog.debug("\(text ?? "") => \(details ?? "")", context: context)
        
        let mode = mode ?? .text
        let duration = duration ?? 2
        let superview: UIView = superview ?? UIApplication.shared.delegate!.window!! as UIView
        
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = UIColor.init(white: 1, alpha: 0.8)
        MBProgressHUD.hide(for: superview, animated: true)
        
        let hud = MBProgressHUD.showAdded(to: superview, animated: true)
        hud.isUserInteractionEnabled = false
        hud.mode = mode
        hud.bezelView.style = .solidColor
        hud.bezelView.color = UIColor.init(white: 0, alpha: 0.8)
        hud.label.textColor = UIColor.init(white: 1, alpha: 0.8)
        hud.detailsLabel.textColor = UIColor.init(white: 1, alpha: 0.8)
        hud.label.text = text;
        hud.detailsLabel.text = details;
        hud.hide(animated: true, afterDelay: duration)
        return hud
    }
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
    
}
