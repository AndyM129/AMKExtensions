//
//  AMTRootViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import Alamofire
import FDFullscreenPopGesture
import FLEX

class AMTRootViewController: UITabBarController {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
        
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tester"
        automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = view.backgroundColor ?? AMTAppearance.viewBackgroundColor
        fd_prefersNavigationBarHidden = true
        setupAppearance()
        setupViewControllers()
        setupFlex()
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
    
    func reloadData() {
        AMTTesterConfigManager.shared.reloadDataFromNetwork(completionHandler: nil)
    }
    
    func checkUpdate() {
        AMTAppUpdateManager.shared.checkUpdate()
    }
    
    // MARK: - Layout Subviews
    
    func setupAppearance() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = AMTAppearance.barBackgroundColor
        tabBar.tintColor = AMTAppearance.selectedTintColor
        tabBar.unselectedItemTintColor = AMTAppearance.unselectedTintColor
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = AMTAppearance.barBackgroundColor
            tabBar.standardAppearance = appearance
        }
    }
    
    func setupViewControllers() {
        viewControllers = [
            AMTNavigationController.init(rootViewController: AMTOpenUrlViewController()),
            AMTNavigationController.init(rootViewController: AMTSettingViewController()),
        ]
    }
    
    // 更新 FLEX 的显示状态
    func setupFlex() {
        NotificationCenter.default.addObserver(forName: Notification.Name.UIApplicationDidBecomeActive, object: nil, queue: .main) { noti in
            if UserDefaults.standard.bool(forKey: AMTConstants.flexSwitchUserDefaultsKey) {
                FLEXManager.shared.showExplorer()
            }
        }
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
