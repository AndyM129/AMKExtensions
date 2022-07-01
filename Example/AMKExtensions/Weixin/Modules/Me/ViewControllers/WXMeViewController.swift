//
//  WXMeViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture

class WXMeViewController: WXViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "我"
        tabBarItem.image = UIImage(color: UIColor.clear, size: WXAppearance.tabBarItemSize)?.byRoundCornerRadius(WXAppearance.tabBarItemCornerRadius, borderWidth: 2, borderColor: WXAppearance.normalTintColor)
        tabBarItem.selectedImage = UIImage(color: WXAppearance.selectedTintColor, size: WXAppearance.tabBarItemSize)?.byRoundCornerRadius(5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fd_prefersNavigationBarHidden = true
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
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.tableHeaderView = {
            let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: view.height))
            tableHeaderView.backgroundColor = .white
            return tableHeaderView
        }()
        tableView.contentInset = UIEdgeInsets(top: -tableView.tableHeaderView!.height, left: 0, bottom: 0, right: 0)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = view.backgroundColor
        tableView.separatorColor = WXAppearance.viewBackgroundColor
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.register(WXMeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(WXMeTableViewCell.self))
        tableView.register(WXMeInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(WXMeInfoTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(UITableViewHeaderFooterView.self))
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var viewModel: WXMeViewModel = {
        return WXMeViewModel.defaults()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemViewModel = viewModel.sections[indexPath.section][indexPath.row]
        
        // 信息 cell
        if itemViewModel is WXMeInfoItemViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WXMeInfoTableViewCell.self), for: indexPath) as! WXMeInfoTableViewCell
            cell.profileImageView.image = UIImage(color: UIColor(red:0.22, green:0.52, blue:0.97, alpha:1.00), size: CGSize(width: 100, height: 100))
            cell.usernameLabel.text = "Andy"
            cell.userIdLabel.text = "微信号：Andy_129"
            return cell
        }

        // 默认 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WXMeTableViewCell.self), for: indexPath) as! WXMeTableViewCell
        cell.iconImageView.image = itemViewModel.iconImage
        cell.titleLabel.text = itemViewModel.title
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return WXAppearance.tableViewSectionIntervalHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemViewModel = viewModel.sections[indexPath.section][indexPath.row]
        if itemViewModel is WXMeInfoItemViewModel {
            return WXMeInfoTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: itemViewModel)
        }
        return WXMeTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: itemViewModel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
    }
    
    // MARK: - Helper Methods
    
}
