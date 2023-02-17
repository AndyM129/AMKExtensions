//
//  AMTOpenUrlViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import Alamofire
import AMKExtensions
import MBProgressHUD

class AMTOpenUrlViewController: AMTViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "调起APP"
        tabBarItem.title = "调起"
        tabBarItem.image = UIImage(named: "amt_tabbar_open_url")
        tabBarItem.selectedImage = UIImage(named: "amt_tabbar_open_url")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: AMTTesterConfigManager.didReloadDataSucceedNotification, object: nil)
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
        view.addSubview(tableView)
        return tableView
    }()
    
    // MARK: - Data & Networking
    
    @objc func reloadData() {
        tableView.reloadData()
    }
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AMTTesterConfigManager.shared.openUrlTab?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel: AMTOpenUrlSectionModel? = AMTTesterConfigManager.shared.openUrlTab?.sections?[section]
        return sectionModel?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel: AMTOpenUrlSectionModel? = AMTTesterConfigManager.shared.openUrlTab?.sections?[indexPath.section]
        let rowModel: AMTOpenUrlSectionRowModel? = sectionModel?.rows?[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            cell!.backgroundColor = AMTAppearance.contentBackgroundColor
            cell!.selectedBackgroundView = UIView(frame: cell!.bounds)
            cell!.selectedBackgroundView?.backgroundColor = AMTAppearance.contentSelectedBackgroundColor
            cell!.textLabel?.textColor = AMTAppearance.titleColor
            cell!.detailTextLabel?.textColor = AMTAppearance.subtitleColor
            cell!.accessoryType = .disclosureIndicator
        }
        cell!.textLabel?.text = rowModel?.title
        cell!.detailTextLabel?.text = rowModel?.detail
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionModel: AMTOpenUrlSectionModel? = AMTTesterConfigManager.shared.openUrlTab?.sections?[section]
        return sectionModel?.header
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionModel: AMTOpenUrlSectionModel? = AMTTesterConfigManager.shared.openUrlTab?.sections?[indexPath.section]
        let rowModel: AMTOpenUrlSectionRowModel? = sectionModel?.rows?[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)
        #if AMKE_TESTER
        BaiduMobStat.default().logEvent("open_url_section_row_clicked")
        #endif
        navigationController?.pushViewController(AMTOpenUrlExamplesViewController(row: rowModel), animated: true)
    }
    
    // MARK: - Helper Methods

}
