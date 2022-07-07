//
//  AMTAppUpdateManager.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import SwiftyJSON
import AMKExtensions

/// APP 更新管理
class AMTAppUpdateManager: NSObject {

    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init() {
        super.init()
        
    }
    
    // MARK: - Getters & Setters
    
    /// 单例
    static let shared: AMTAppUpdateManager = AMTAppUpdateManager()
    
    // MARK: - Data & Networking
    
    typealias completionHandler = (_ error: Error?) -> Void

    /// 检查更新
    func checkUpdate(completionHandler: completionHandler? = nil) {
        let application = UIApplication.shared

        let urlString = "https://www.pgyer.com/apiv2/app/check"
        let parameters = [
            "_api_key":"aa1abe8fdeeb4d03892ef754f8784056",
//            "appKey":"83aebffc93f0ea1679a2531a7fbaa478",
//            "buildVersion": application.appVersion,
//            "buildBuildVersion": application.appBuildVersion,
            "appKey":"692561894dfd04df5d78b5274a3824c8",
            "buildVersion": "6.7.8",
            "buildBuildVersion": "3",
        ]
        AF.request(urlString, parameters: parameters).response { response in
            guard let data = response.data else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "返回 data 为空"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            guard let json = try? JSON(data: data) else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "data 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            AMKELog.debug(json)

            guard let buildHaveNewVersion = json["data"]["buildHaveNewVersion"].bool else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "buildHaveNewVersion 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            guard let buildVersionNo = json["data"]["buildVersionNo"].string else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "buildVersionNo 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            guard let buildUpdateDescription = json["data"]["buildUpdateDescription"].string else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "buildUpdateDescription 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            guard let downloadURL = json["data"]["downloadURL"].string else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "downloadURL 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            
            let title = "有新版本啦，去更新？"
            let message = "v\(buildVersionNo)\n\(buildUpdateDescription)"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "好的", style: .destructive, handler: { alertAction in
                UIApplication.shared.open(URL(string: downloadURL)!)
            }))
            alertController.addAction(UIAlertAction(title: "取消", style: .cancel))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true)
        }
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods

    
}
