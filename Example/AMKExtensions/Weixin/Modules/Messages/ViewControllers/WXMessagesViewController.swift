//
//  WXMessagesViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 消息
class WXMessagesViewController: WXViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "微信"
        tabBarItem.image = UIImage.wx_iconImage(color: WXAppearance.normalTintColor, size: WXAppearance.tabBarItemSize)
        tabBarItem.selectedImage = UIImage.wx_selectedIconImage(color: WXAppearance.selectedTintColor, size: WXAppearance.tabBarItemSize)
        tabBarItem.badgeColor = WXAppearance.tabBarItemBadgeColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = floatingWindowBarButtonItem
        navigationItem.rightBarButtonItem = addBarButtonItem
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    // MARK: - Getters & Setters
    
    lazy var addBarButtonItem: UIBarButtonItem = {
        let image = UIImage.wx_iconImage(size: 30)?.withRenderingMode(.alwaysOriginal)
        let addBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addBarButtonItemClicked))
        return addBarButtonItem
    }()
    
    lazy var floatingWindowBarButtonItem: UIBarButtonItem = {
        let image = UIImage.wx_iconImage(size: 30)?.withRenderingMode(.alwaysOriginal)
        let floatingWindowBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(floatingWindowBarButtonItemClicked))
        return floatingWindowBarButtonItem
    }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorColor = WXAppearance.viewBackgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
        tableView.backgroundColor = view.backgroundColor
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.register(WXMessagesTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(WXMessagesTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(UITableViewHeaderFooterView.self))
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var viewModel: WXMessagesViewModel = {
        return WXMessagesViewModel.defaults()
    }()
    
    // MARK: - Data & Networking
    
    func reloadData() {
        reloadData(completion: nil)
    }
    
    func reloadData(completion: WXNetworkingCompletionBlock?) {
        viewModel.reloadData { [unowned self] responseObject, error in
            tableView.reloadData()
            completion?(responseObject, error)
        }
    }
    
    // MARK: - Layout Subviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: - Action Methods
    
    @objc func addBarButtonItemClicked(sender: Any?) {
        print("addBarButtonItemClicked: \(sender ?? "")")
    }
    
    @objc func floatingWindowBarButtonItemClicked(sender: Any?) {
        print("floatingWindowBarButtonItemClicked: \(sender ?? "")")
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WXMessagesTableViewCell.self), for: indexPath) as! WXMessagesTableViewCell
        cell.iconImageView.image = itemViewModel.iconImage
        cell.titleLabel.text = itemViewModel.title
        cell.subtitleLabel.text = itemViewModel.subtitle
        cell.updateDateLabel.text = itemViewModel.updateDateString
        cell.muteImageView.isHidden = !itemViewModel.isMute
        cell.isPinned = itemViewModel.isPinned
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemViewModel = viewModel.sections[indexPath.section][indexPath.row]
        return WXMessagesTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: itemViewModel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
    }
    
    // MARK: - Helper Methods


}
