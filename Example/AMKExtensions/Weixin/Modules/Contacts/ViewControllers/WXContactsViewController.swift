//
//  WXContactsViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class WXContactsViewController: WXViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "通讯录"
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
        navigationItem.rightBarButtonItem = addContactBarButtonItem
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
    
    lazy var addContactBarButtonItem: UIBarButtonItem = {
        let image = UIImage.wx_iconImage(size: 30)?.withRenderingMode(.alwaysOriginal)
        let addContactBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addContactBarButtonItemClicked))
        return addContactBarButtonItem
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        searchBar.placeholder = "搜索"
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = false
        searchBar.backgroundColor = WXAppearance.viewBackgroundColor
        return searchBar
    }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.addSubview({
            let tableHeaderView = UIView(frame: CGRect(x: 0, y: -view.height, width: tableView.width, height: view.height))
            tableHeaderView.backgroundColor = WXAppearance.viewBackgroundColor
            return tableHeaderView
        }())
        tableView.tableHeaderView = searchBar
        tableView.tableFooterView = WXContactsTableFooterView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 50))
        tableView.backgroundColor = .white
        tableView.separatorColor = WXAppearance.viewBackgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 62, bottom: 0, right: 0)
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.register(WXContactsTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(WXContactsTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(WXContactsTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(WXContactsTableViewHeaderView.self))
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(UITableViewHeaderFooterView.self))
        view.addSubview(tableView)        
        return tableView
    }()
    
    lazy var viewModel: WXContactsViewModel = {
        return WXContactsViewModel.defaults()
    }()
    
    // MARK: - Data & Networking
    
    func reloadData() {
        reloadData(completion: nil)
    }
    
    func reloadData(completion: WXNetworkingCompletionBlock?) {
        viewModel.reloadData { [unowned self] responseObject, error in
            let tableFooterView = tableView.tableFooterView as! WXContactsTableFooterView
            tableFooterView.titleLabel.text = "\(viewModel.totalCount)个朋友及联系人"
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
    
    @objc func addContactBarButtonItemClicked(sender: Any?) {
        print("addContactBarButtonItemClicked: \(sender ?? "")")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WXContactsTableViewCell.self), for: indexPath) as! WXContactsTableViewCell
        cell.iconImageView.image = itemViewModel.iconImage
        cell.titleLabel.text = itemViewModel.title
        return cell
    }
           
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return WXContactsTableViewHeaderView.tableView(tableView, heightForHeaderInSection: section, withData: nil)
        }
        return 1
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WXContactsTableViewCell.tableView(tableView, heightForRowAt: indexPath, withData: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(WXContactsTableViewHeaderView.self)) as! WXContactsTableViewHeaderView
        headerView.titleLabel.text = section == 1 ? "⭐️ 星标朋友" : nil
        return headerView
    }
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
    }
    
    // MARK: - Helper Methods


}
