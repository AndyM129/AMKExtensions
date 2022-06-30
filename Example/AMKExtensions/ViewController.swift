//
//  ViewController.swift
//  AMKExtensions
//
//  Created by Andy Meng on 06/29/2022.
//  Copyright (c) 2022 Andy Meng. All rights reserved.
//

import UIKit
import SnapKit
import AMKExtensions

typealias ExampleClickedBlock = (_ example: Example)->Void

class Example: NSObject {
    var title: String?
    var subtitle: String?
    var clickedBlock: ExampleClickedBlock?
    
    init(title: String?, subtitle: String?, clickedBlock: ExampleClickedBlock?) {
        self.title = title
        self.subtitle = subtitle
        self.clickedBlock = clickedBlock
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Title"
        automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = view.backgroundColor ?? UIColor.white
        tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1)) { [unowned self] in
            navigationController?.pushViewController(WXRootViewController(), animated: true)
        }
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var examples: [Example] = {
        var examples = [Example]()
        examples.append(Example(title: "AMTempViewController", subtitle: "", clickedBlock: { [unowned self] example in
            navigationController?.pushViewController(AMTempViewController(), animated: true)
        }))
        examples.append(Example(title: "AMDemoTableViewController", subtitle: "", clickedBlock: { [unowned self] example in
            navigationController?.pushViewController(AMDemoTableViewController(), animated: true)
        }))
        examples.append(Example(title: "AMDemoCollectionViewController", subtitle: "", clickedBlock: { [unowned self] example in
            navigationController?.pushViewController(AMDemoCollectionViewController(), animated: true)
        }))
        examples.append(Example(title: "仿微信", subtitle: "", clickedBlock: { [unowned self] example in
            navigationController?.pushViewController(WXRootViewController(), animated: true)
        }))
        return examples
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
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let example = examples[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = example.title
        cell.detailTextLabel?.text = example.subtitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let example = examples[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        example.clickedBlock?(example)
    }
    
    // MARK: - Helper Methods
    
}

