//
//  AMTOpenUrlDetailViewController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTOpenUrlDetailViewController: AMTViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "调起阅读页"
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            cell!.backgroundColor = .white
            cell!.selectedBackgroundView = UIView(frame: cell!.bounds)
            cell!.selectedBackgroundView?.backgroundColor = AMTAppearance.tableViewCellSelectedBackgroundColor
            cell!.textLabel?.numberOfLines = 0
            cell!.detailTextLabel?.numberOfLines = 0
            cell!.detailTextLabel?.textColor = .lightGray
            cell!.accessoryType = .disclosureIndicator
        }
        cell!.textLabel?.text = "调起 \(indexPath.row)文档"
        cell!.detailTextLabel?.text = ["router": "xxx://yyy/zzz?key=value", "pasteboard": "asdjlasdkasd.asmd';,wE'D,;WLEMD/;KAKWEMDKAMDAMSDMAsd.,m/wklemdkamSDM"].description
        return cell!
    }
    
    // MARK: UITableViewDelegate
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tableViewDidSelectRow: \(tableView), \(indexPath)")
    }
    
    // MARK: - Helper Methods


}
