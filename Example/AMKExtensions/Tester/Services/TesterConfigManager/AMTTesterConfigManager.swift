//
//  AMTTesterConfigManager.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import AMKExtensions
import SwiftyJSON

class AMTTesterConfigManager: NSObject {
    
    // MARK: - Deinit Methods
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init() {
        super.init()
    }
    
    // MARK: - Getters & Setters
    
    /// 单例
    static let shared: AMTTesterConfigManager = AMTTesterConfigManager()
    
    /// 「调起」Tab 的相关配置
    var openUrlTab: AMTOpenUrlTabModel? = AMTOpenUrlTabModel()
    
    // MARK: - Data & Networking
    
    typealias completionHandler = (_ error: Error?) -> Void
    
    /// 联网刷新数据
    func reloadDataFromNetwork(completionHandler: completionHandler?) {
        NotificationCenter.default.post(name: AMTTesterConfigManager.willReloadDataNotification, object: nil)
        
        let urlString = "https://www.fastmock.site/mock/918edb52006d5f75261f317f3ba37180/tester/data"
        AF.request(urlString).response { [unowned self] response in
            guard let data = response.data else {
                let userInfo = [ NSLocalizedDescriptionKey: "数据刷新失败", NSLocalizedFailureReasonErrorKey: "返回 data 为空"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                NotificationCenter.default.post(name: AMTTesterConfigManager.didReloadDataFailedNotification, object: nil, userInfo: userInfo)
                return
            }
            guard let jsonString = String(data: data, encoding: .utf8) else {
                let userInfo = [ NSLocalizedDescriptionKey: "数据刷新失败", NSLocalizedFailureReasonErrorKey: "data 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                NotificationCenter.default.post(name: AMTTesterConfigManager.didReloadDataFailedNotification, object: nil, userInfo: userInfo)
                return
            }
            guard let model = AMTTesterConfigNetworkModel.deserialize(from: jsonString) else {
                let userInfo = [ NSLocalizedDescriptionKey: "数据刷新失败", NSLocalizedFailureReasonErrorKey: "model 解析失败"]
                MBProgressHUD.amt_showHUD(text: userInfo[NSLocalizedDescriptionKey], details: userInfo[NSLocalizedFailureReasonErrorKey], context: response)
                NotificationCenter.default.post(name: AMTTesterConfigManager.didReloadDataFailedNotification, object: nil, userInfo: userInfo)
                return
            }
            
            AMKELog.info(JSON(parseJSON: jsonString))
            openUrlTab = model.data?.openUrlTab
            NotificationCenter.default.post(name: AMTTesterConfigManager.didReloadDataSucceedNotification, object: nil)
        }
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Methods
    
}

/// 定义相关通知
extension AMTTesterConfigManager {
    /// 准备刷新数据
    public static let willReloadDataNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.willReloadData")
    /// 数据刷新成功
    public static let didReloadDataSucceedNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.configManager.didReloadDataSucceed")
    /// 数据刷新失败
    public static let didReloadDataFailedNotification = Notification.Name(rawValue: "com.github.andym129.tester.notification.name.configManager.didReloadDataFailed")
}
