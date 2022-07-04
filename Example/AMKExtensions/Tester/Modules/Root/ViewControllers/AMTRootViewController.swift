//
//  AMTRootViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

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
        view.backgroundColor = view.backgroundColor ?? UIColor.white
        fd_prefersNavigationBarHidden = true
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = AMTAppearance.selectedTintColor
        tabBar.unselectedItemTintColor = AMTAppearance.normalTintColor
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor.white
            tabBar.standardAppearance = appearance
        }
                
        viewControllers = [
            AMTNavigationController.init(rootViewController: AMTOpenUrlViewController()),
            AMTNavigationController.init(rootViewController: AMTSettingsViewController()),
        ]
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
    
    // MARK: - Layout Subviews
    
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
