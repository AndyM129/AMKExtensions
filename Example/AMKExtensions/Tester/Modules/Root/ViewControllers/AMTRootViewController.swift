//
//  AMTRootViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import FLEX
import Alamofire
import AMKExtensions
import FDFullscreenPopGesture

class AMTRootViewController: AMTTabBarController {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init() {
        super.init()
        setupBaiduMobStat()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tester"
        fd_prefersNavigationBarHidden = true
        setupViewControllers()
        FLEXManager.shared.amt_setup()
        reloadData()
        checkUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    // MARK: - Getters & Setters
    
    // MARK: - Data & Networking
    
    func setupBaiduMobStat() {
        #if AMKE_TESTER
        DispatchQueue.amke_once(token: "\(AMTRootViewController.self).setupBaiduMobStat()") {
            BaiduMobStat.default().start(withAppId: AMTConstants.mtjAppKey)
            AMKELog.debug("[BaiduMobStat] AppKey: " + AMTConstants.mtjAppKey)
            AMKELog.debug("[BaiduMobStat] getDeviceCuid: " + BaiduMobStat.default().getDeviceCuid())
            AMKELog.debug("[BaiduMobStat] getTestDeviceId: " + BaiduMobStat.default().getTestDeviceId())
        }
        #endif
    }
    
    func reloadData() {
        AMTTesterConfigManager.shared.reloadDataFromNetwork(completionHandler: nil)
    }
    
    func checkUpdate() {
        AMTAppUpdateManager.shared.checkUpdate()
    }
    
    // MARK: - Layout Subviews
    
    func setupViewControllers() {
        viewControllers = [
            AMTNavigationController.init(rootViewController: AMTOpenUrlViewController()),
            AMTNavigationController.init(rootViewController: AMTSettingViewController()),
        ]
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods


}
