//
//  AMTOpenUrlDetailViewController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import MBProgressHUD
import YYCategories

class AMTOpenUrlExamplesViewController: AMTViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init(row: AMTOpenUrlSectionRowModel?) {
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
        self.row = row
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = row?.title ?? "相关示例"
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
        view.addSubview(tableView)
        return tableView
    }()
    
    var row: AMTOpenUrlSectionRowModel?
    
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
        return row?.examples?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let example: AMTOpenUrlExampleModel? = row?.examples?[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            cell!.backgroundColor = AMTAppearance.contentBackgroundColor
            cell!.selectedBackgroundView = UIView(frame: cell!.bounds)
            cell!.selectedBackgroundView?.backgroundColor = AMTAppearance.contentSelectedBackgroundColor
            cell!.textLabel?.numberOfLines = 0
            cell!.textLabel?.textColor = AMTAppearance.titleColor
            cell!.detailTextLabel?.numberOfLines = 0
            cell!.detailTextLabel?.textColor = AMTAppearance.subtitleColor
            cell!.accessoryType = .disclosureIndicator
        }
        cell!.textLabel?.text = example?.title
        cell!.detailTextLabel?.text = example?.detailText
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return row?.detail
    }
    
    // MARK: UITableViewDelegate
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let example: AMTOpenUrlExampleModel? = row?.examples?[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        // 参数校验
        guard let router = example?.router?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            MBProgressHUD.amt_showHUD(text: "无效路由", context: example?.toJSON)
            return
        }
        guard let url = URL(string: router) else {
            MBProgressHUD.amt_showHUD(text: "路由解析异常", context: example?.toJSON)
            return
        }
        
        // 写入剪贴板，并尝试调起
        UIPasteboard.general.string = example?.pasteboard
        UIApplication.shared.open(url, options: [:]) { succeed in
            if !succeed {
                MBProgressHUD.amt_showHUD(text: "调起失败", context: example?.toJSON)
            }
        }
    }
    
    // MARK: - Helper Methods

}
