//
//  FLEXManager+AMTExtensions.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/8.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import Foundation
import FLEX
import AMKExtensions
import SwiftyJSON

extension FLEXManager {
    
    // MARK: - Getters & Setters
    
    // MARK: - Data & Networking
        
    func amt_setup() {
        DispatchQueue.amke_once(token: "\(FLEXManager.self).amt_setup()") {
            NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationDidBecomeActive, object: nil, queue: .main) { noti in
                if UserDefaults.standard.bool(forKey: AMTConstants.flexSwitchUserDefaultsKey) {
                    FLEXManager.shared.showExplorer()
                }
            }
            
            FLEXManager.shared.registerGlobalEntry(withName: "MTJ Info") {
                var dict = [String: Any?]()
                dict["DebugMode"] = AMTConstants.isDebugMode
                dict["AppKey"] = AMTConstants.mtjAppKey
                dict["getDeviceCuid"] = BaiduMobStat.default().getDeviceCuid()
                dict["getTestDeviceId"] = BaiduMobStat.default().getTestDeviceId()

                let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                let jsonString = String(data: jsonData ?? Data(), encoding: .utf8)
                
                let viewController = AMTTextViewController()
                viewController.title = "MTJ Info"
                viewController.textView.text = jsonString
                return viewController
            }
        }
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}


