//
//  AMTTabBarController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/8.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTTabBarController: UITabBarController {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = view.backgroundColor ?? AMTAppearance.viewBackgroundColor
        
        tabBar.isTranslucent = false
        tabBar.tintColor = AMTAppearance.selectedTintColor
        tabBar.unselectedItemTintColor = AMTAppearance.unselectedTintColor
        tabBar.barTintColor = AMTAppearance.barBackgroundColor
        tabBar.shadowImage = UIImage(color: UIColor.clear)
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = AMTAppearance.barBackgroundColor
            appearance.shadowColor = UIColor.clear
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) { tabBar.scrollEdgeAppearance = appearance }
        } else {
            // Fallback on earlier versions
        }
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
