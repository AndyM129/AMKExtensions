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
    
    /// 检查更新 - 检查结果
    var checkData: AMTAppUpdateCheckDataModel?
    
    // MARK: - Data & Networking
    
    typealias completionHandler = (_ error: Error?) -> Void

    /// 检查更新
    func checkUpdate(silent: Bool = true, completionHandler: completionHandler? = nil) {
        let urlString = "https://www.pgyer.com/apiv2/app/check"
        let parameters = [
            "_api_key":"aa1abe8fdeeb4d03892ef754f8784056",
            
//            "appKey":"83aebffc93f0ea1679a2531a7fbaa478",
//            "buildVersion": UIApplication.shared.appVersion,
//            "buildBuildVersion": UIApplication.shared.appBuildVersion,
            
            "appKey":"692561894dfd04df5d78b5274a3824c8",
            "buildVersion": "6.7.8",
            "buildBuildVersion": "3",
        ]
        AF.request(urlString, parameters: parameters).response { [unowned self] response in
            // 数据解析 & 校验
            guard let data = response.data else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "返回 data 为空"]
                if !silent { MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response) }
                return
            }
            guard let jsonString = String(data: data, encoding: .utf8) else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "data 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                return
            }
            AMKELog.debug(JSON(parseJSON: jsonString))
            guard let checkModel = AMTAppUpdateCheckModel.deserialize(from: jsonString), checkModel.isValid else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "model 解析失败"]
                if !silent { MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response) }
                return
            }

            // 保存数据
            checkData = checkModel.data!
            
            // 无新版本
            if !checkData!.buildHaveNewVersion! {
                if !silent { MBProgressHUD.amt_showHUD(text: "检查更新", details: "当前为最新版本", context: response) }
                return
            }
            
            // 有新版本
            let title = "v\(checkData!.buildVersionNo!) 上线啦，去更新？"
            let message = checkData!.buildUpdateDescription!
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "好的", style: .destructive, handler: { [unowned self] alertAction in
                UIApplication.shared.open(URL(string: checkData!.downloadURL!)!)
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
