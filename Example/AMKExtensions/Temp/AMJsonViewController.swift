//
//  AMKNetworkingViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SnapKit
import AMKExtensions
import AMKStackView

class AMJsonViewController: AMStackViewController {
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Json 相关处理"
        stackView.addArrangedButton("Json 与 Object 互转", controlEvents: .touchUpInside) { [unowned self] sender in
            navigationController?.pushViewController(AMJsonAndObjectViewController(), animated: true)
        }
        stackView.addArrangedButton("Json 与 Model 互转", controlEvents: .touchUpInside) { [unowned self] sender in
            navigationController?.pushViewController(AMJsonAndModelViewController(), animated: true)
        }
    }
                
    // MARK: - Action Methods

    

}

