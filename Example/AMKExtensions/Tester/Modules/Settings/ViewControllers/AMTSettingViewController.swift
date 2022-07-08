//
//  AMTSettingsViewController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import FLEX
import SafariServices

class AMTSettingViewController: AMTViewController, UITableViewDataSource, UITableViewDelegate {

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
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppUpdateDidCheckSucceedNotification), name: AMTAppUpdateManager.didCheckSucceedNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
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
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = 0 }
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
    
    @objc func handleAppUpdateDidCheckSucceedNotification(sender: Any) {
        tableView.reloadData()
    }
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(AMTSettingIconTableViewCell.self)) ?? AMTSettingIconTableViewCell(style: .default, reuseIdentifier: AMTSettingIconTableViewCell.className())
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AMTSettingTableViewCell.className()) as? AMTSettingTableViewCell ?? AMTSettingTableViewCell(style: .value1, reuseIdentifier: AMTSettingTableViewCell.className())
            cell.textLabel?.text = "更新配置"
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AMTSettingTableViewCell.className()) as? AMTSettingTableViewCell ?? AMTSettingTableViewCell(style: .value1, reuseIdentifier: AMTSettingTableViewCell.className())
            cell.textLabel?.text = "功能介绍"
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AMTSettingTableViewCell.className()) as? AMTSettingTableViewCell ?? AMTSettingTableViewCell(style: .value1, reuseIdentifier: AMTSettingTableViewCell.className())
            cell.textLabel?.text = "检查更新"
            if let checkData = AMTAppUpdateManager.shared.checkData, checkData.isValid {
                cell.detailTextLabel?.text = checkData.buildHaveNewVersion! ? "可升级至 v\(checkData.buildVersionNo!)" : "已是最新版"
                cell.badgeView.isHidden = !checkData.buildHaveNewVersion!
            }
            return cell
        }
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AMTSettingSwitchTableViewCell.className()) as? AMTSettingSwitchTableViewCell ?? AMTSettingSwitchTableViewCell(style: .value1, reuseIdentifier: AMTSettingTableViewCell.className())
            cell.textLabel?.text = "FLEX 开关"
            cell.accessorySwitch.setBlockFor(.valueChanged) { [unowned cell] sender in
                cell.accessorySwitch.isOn ? FLEXManager.shared.showExplorer() : FLEXManager.shared.hideExplorer()
                UserDefaults.standard.set(cell.accessorySwitch.isOn, forKey: AMTConstants.flexSwitchUserDefaultsKey)
                UserDefaults.standard.synchronize()
                BaiduMobStat.default().logEvent("setting_flex_switch_clicked", attributes: ["isOn": cell.accessorySwitch.isOn ? "1" : "0"])
            }
            return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className(), for: indexPath)
    }
        
    // MARK: UITableViewDelegate
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return AMTSettingIconTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: nil)
        case 1, 2, 3: return AMTSettingTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: nil)
        case 4: return AMTSettingSwitchTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: nil)
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
        
        if indexPath.row == 1 {
            AMTTesterConfigManager.shared.reloadDataFromNetwork(completionHandler: nil)
            BaiduMobStat.default().logEvent("setting_reload_config_clicked")
        }
        else if indexPath.row == 2 {
            let urlString = "https://www.pgyer.com/wktester"
            let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
            safariViewController.hidesBottomBarWhenPushed = true
            safariViewController.preferredBarTintColor = AMTAppearance.barBackgroundColor
            safariViewController.preferredControlTintColor = AMTAppearance.selectedTintColor
            navigationController?.pushViewController(safariViewController, animated: true)
            BaiduMobStat.default().logEvent("setting_app_intro_clicked")
        }
        else if indexPath.row == 3 {
            AMTAppUpdateManager.shared.checkUpdate(silent: false)
            BaiduMobStat.default().logEvent("setting_update_check_clicked")
        }
    }
    
    // MARK: - Helper Methods

}
