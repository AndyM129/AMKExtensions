//
//  AMTTextViewController.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/8.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTTextViewController: AMTViewController {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    // MARK: - Getters & Setters
    
    lazy var textView: UITextView = { [unowned self] in
        let textView = UITextView()
        textView.backgroundColor = view.backgroundColor
        textView.textColor = AMTAppearance.titleColor
        textView.isEditable = false;
        textView.isSelectable = true;
        view.addSubview(textView)
        return textView
    }()
    
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        textView.snp.remakeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(navigationController?.navigationBar.snp.bottom ?? view)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods


}
