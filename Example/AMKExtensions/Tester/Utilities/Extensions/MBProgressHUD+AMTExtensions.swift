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
        
        MBProgressHUD.hide(for: superview, animated: true)
        
        let hud = MBProgressHUD.showAdded(to: superview, animated: true)
        hud.isUserInteractionEnabled = false
        hud.mode = mode
        hud.contentColor = AMTAppearance.toastTitleColor
        hud.bezelView.style = .solidColor
        hud.bezelView.color = AMTAppearance.toastBackgroundColor
        hud.label.textColor = AMTAppearance.toastTitleColor
        hud.detailsLabel.textColor = AMTAppearance.toastSubtitleColor
        hud.label.text = text;
        hud.detailsLabel.text = details;
        hud.hide(animated: true, afterDelay: duration)
        return hud
    }
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
    
}
