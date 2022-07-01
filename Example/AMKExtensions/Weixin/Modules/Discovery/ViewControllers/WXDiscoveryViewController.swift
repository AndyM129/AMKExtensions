//
//  WXDiscoveryViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class WXDiscoveryViewController: WXViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "发现"
        tabBarItem.image = UIImage(color: UIColor.clear, size: WXAppearance.tabBarItemSize)?.byRoundCornerRadius(WXAppearance.tabBarItemCornerRadius, borderWidth: 2, borderColor: WXAppearance.normalTintColor)
        tabBarItem.selectedImage = UIImage(color: WXAppearance.selectedTintColor, size: WXAppearance.tabBarItemSize)?.byRoundCornerRadius(5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorColor = WXAppearance.viewBackgroundColor
        tableView.backgroundColor = view.backgroundColor
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.register(WXDiscoveryTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(WXDiscoveryTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(UITableViewHeaderFooterView.self))
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var viewModel: WXDiscoveryViewModel = {
        let viewModel = WXDiscoveryViewModel(sections: nil)
        viewModel.sections.append([
            WXDiscoveryItemViewModel(title: "朋友圈", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.52, green:0.81, blue:0.00, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        viewModel.sections.append([
            WXDiscoveryItemViewModel(title: "扫一扫", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.22, green:0.43, blue:0.90, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        viewModel.sections.append([
            WXDiscoveryItemViewModel(title: "看一看", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.94, green:0.73, blue:0.00, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXDiscoveryItemViewModel(title: "搜一搜", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.89, green:0.27, blue:0.22, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        viewModel.sections.append([
            WXDiscoveryItemViewModel(title: "小程序", iconImage: UIImage(color: UIColor.clear, size: CGSize(width: 20, height: 20))?.byRoundCornerRadius(3, borderWidth: 1.5, borderColor: UIColor(red:0.36, green:0.22, blue:0.91, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        return viewModel
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WXDiscoveryTableViewCell.self), for: indexPath) as! WXDiscoveryTableViewCell
        cell.backgroundColor = UIColor.white
        cell.selectedBackgroundView = UIView(frame: cell.bounds)
        cell.selectedBackgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.1)
        cell.iconImageView.image = itemViewModel.iconImage
        cell.titleLabel.text = itemViewModel.title
        cell.profileImageView.image = UIImage(color: UIColor(red:0.93, green:0.33, blue:0.27, alpha:1.00), size: CGSize(width: 17, height: 17))
        cell.profileImageView.isHidden = indexPath.section==0 && indexPath.row==0 ? false : true
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
    }
        
    // MARK: - Helper Methods

}
