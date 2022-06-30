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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AMKExtensions"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.pushViewController(AMDemoCollectionViewController.init(), animated: true)
    }

}

