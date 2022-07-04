//
//  AMTOpenUrlViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

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
        reloadDataFromNetworking(completionHandler: nil)
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
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var viewModel: AMTOpenUrlTabViewModel = {
        return AMTOpenUrlTabViewModel(sectionViewModels: nil)
    }()
    
    // MARK: - Data & Networking
    
    func reloadDataFromNetworking(completionHandler: AMTOpenUrlTabViewModelReloadCompletionHandler?) {
        viewModel.reloadDataFromNetworking { [unowned self] error in
            guard error == nil else {
                print("刷新失败：\(error!)")
                return
            }
            
            tableView.reloadData()
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
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            cell!.backgroundColor = .white
            cell!.selectedBackgroundView = UIView(frame: cell!.bounds)
            cell!.selectedBackgroundView?.backgroundColor = AMTAppearance.tableViewCellSelectedBackgroundColor
            cell!.detailTextLabel?.textColor = .lightGray
            cell!.accessoryType = .disclosureIndicator
        }
        cell!.textLabel?.text = "调起阅读页"
        cell!.detailTextLabel?.text = "附加说明"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(format: "阅读页", section)
    }
        
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
        navigationController?.pushViewController(AMTOpenUrlDetailViewController(), animated: true)
    }
    
    // MARK: - Helper Methods

}
