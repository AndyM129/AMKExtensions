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
        lastDateForIgnoreAlert = UserDefaults.standard.object(forKey: lastDateForIgnoreAlertUserDefaultsKey) as? Date
    }
    
    // MARK: - Getters & Setters
    
    /// 单例
    static let shared: AMTAppUpdateManager = AMTAppUpdateManager()
    
    /// 检查更新 - 检查结果
    var checkData: AMTAppUpdateCheckDataModel?
    
    /// 上次点击升级弹窗的「不再提示」的日期 - UserDefaultsKey
    fileprivate let lastDateForIgnoreAlertUserDefaultsKey = "com.github.andym129.tester.userDefaults.key.lastDateForIgnoreAlert"

    /// 上次点击升级弹窗的「不再提示」的日期
    fileprivate var lastDateForIgnoreAlert: Date? {
        didSet {
            UserDefaults.standard.set(lastDateForIgnoreAlert, forKey: lastDateForIgnoreAlertUserDefaultsKey)
        }
    }
    
    /// 是否应该 显示升级弹窗
    var shouldAutoAlertForUpdate: Bool {
        if let lastDateForIgnoreAlert = lastDateForIgnoreAlert, Calendar.current.isDateInToday(lastDateForIgnoreAlert) {
            return false
        }
        return true
    }
    
    // MARK: - Data & Networking
    
    typealias completionHandler = (_ error: Error?) -> Void

    /// 检查更新
    func checkUpdate(silent: Bool = true, completionHandler: completionHandler? = nil) {
        NotificationCenter.default.post(name: AMTAppUpdateManager.willCheckNotification, object: nil)
        
        let urlString = "https://www.pgyer.com/apiv2/app/check"
        let parameters = [
            "_api_key":"aa1abe8fdeeb4d03892ef754f8784056",
            "appKey":"83aebffc93f0ea1679a2531a7fbaa478",
            "buildVersion": UIApplication.shared.appVersion,
            "buildBuildVersion": UIApplication.shared.appBuildVersion,
        ]
        AF.request(urlString, parameters: parameters).response { [unowned self] response in
            // 数据解析 & 校验
            guard let data = response.data else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "返回 data 为空"]
                if !silent { MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response) }
                NotificationCenter.default.post(name: AMTAppUpdateManager.didCheckFailedNotification, object: nil, userInfo: userInfo)
                return
            }
            guard let jsonString = String(data: data, encoding: .utf8) else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "data 解析失败"]
                if !silent { MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response) }
                NotificationCenter.default.post(name: AMTAppUpdateManager.didCheckFailedNotification, object: nil, userInfo: userInfo)
                return
            }
            AMKELog.debug(JSON(parseJSON: jsonString))
            guard let checkModel = AMTAppUpdateCheckModel.deserialize(from: jsonString), checkModel.isValid else {
                let userInfo = [ NSLocalizedDescriptionKey: "检查更新失败", NSLocalizedFailureReasonErrorKey: "model 解析失败"]
                if !silent { MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response) }
                NotificationCenter.default.post(name: AMTAppUpdateManager.didCheckFailedNotification, object: nil, userInfo: userInfo)
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
            let title = "v\(checkData!.buildVersion!) 上线啦，去更新？"
            let message = checkData!.buildUpdateDescription!
            if silent && !shouldAutoAlertForUpdate {
                return AMKELog.info("【此次不提示】\(title) => \(message) => \(checkData!.downloadURL!)")
            }
            let alertController = AMTAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "立即更新", style: .destructive, handler: { [unowned self] alertAction in
                UIApplication.shared.open(URL(string: checkData!.downloadURL!)!) { [unowned self] success in
                    if success { return }
                    UIPasteboard.general.string = checkData!.downloadURL
                    MBProgressHUD.amt_showHUD(text: "检查更新", details: "安装地址已写入剪贴板，请手动在 Safari 中打开并安装", context: response)
                }
            }))
            if silent { alertController.addAction(UIAlertAction(title: "今日不再提示", style: .default, handler: { [unowned self] alertAction in
                lastDateForIgnoreAlert = Date()
            }))}
            alertController.addAction(UIAlertAction(title: "下次吧", style: .cancel))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true)
            NotificationCenter.default.post(name: AMTTesterConfigManager.didReloadDataSucceedNotification, object: nil)
        }
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}

/// 定义相关通知
extension AMTAppUpdateManager {
    /// 准备检查更新
    public static let willCheckNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.willCheck")
    /// 检查更新成功
    public static let didCheckSucceedNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.configManager.didCheckSucceed")
    /// 检查更新失败
    public static let didCheckFailedNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.configManager.didCheckFailed")
}
