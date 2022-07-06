//
//  AMTSettingsViewController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import FLEX

class AMTSettingsViewController: AMTViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "设置"
        tabBarItem.image = UIImage(named: "amt_tabbar_setting")
        tabBarItem.selectedImage = UIImage(named: "amt_tabbar_setting")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
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
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = view.backgroundColor
        tableView.separatorColor = tableView.backgroundColor
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        tableView.register(AMTSettingsIconTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(AMTSettingsIconTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(UITableViewHeaderFooterView.self))
        view.addSubview(tableView)
        return tableView
    }()
    
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
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(AMTSettingsIconTableViewCell.self), for: indexPath) as! AMTSettingsIconTableViewCell
        }
        
        if indexPath.row == 1 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
            cell.textLabel?.text = "联网更新配置"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        if indexPath.row == 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
            cell.textLabel?.text = "FLEX 开关"
            cell.accessoryView = {
                let flexSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
                flexSwitch.onTintColor = AMTAppearance.tintColor
                flexSwitch.isOn = UserDefaults.standard.bool(forKey: AMTConstants.flexSwitchUserDefaultsKey)
                flexSwitch.addBlock(for: .valueChanged) {[unowned flexSwitch] sender in
                    flexSwitch.isOn ? FLEXManager.shared.showExplorer() : FLEXManager.shared.hideExplorer()
                    UserDefaults.standard.set(flexSwitch.isOn, forKey: AMTConstants.flexSwitchUserDefaultsKey)
                }
                return flexSwitch
            }()
            return cell
        }
        
        return tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
    }
        
    // MARK: UITableViewDelegate
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return AMTSettingsIconTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: nil)
        }
        return 50
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
        
        if indexPath.row == 1 {
            AMTTesterConfigManager.shared.reloadDataFromNetwork(completionHandler: nil)
        }
    }
    
    // MARK: - Helper Methods

}
