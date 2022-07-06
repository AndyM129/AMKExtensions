//
//  AMToastViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/5.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
//import ProgressHUD
import MBProgressHUD

class AMToastViewController: AMStackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Toast"
        test_MBProgressHUD()
    }
    
    // MARK: - MBProgressHUD
    
    // https://github.com/jdg/MBProgressHUD
    func test_MBProgressHUD() {
        stackView.addArrangedSeparator(withTitle: "MBProgressHUD", color: view.tintColor, size: 13)
        stackView.addArrangedButton("show loading", controlEvents: .touchUpInside) { [unowned self] sender in
            UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = UIColor.init(white: 1, alpha: 0.8)
            MBProgressHUD.hide(for: view, animated: true)
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.isUserInteractionEnabled = false
            hud.mode = .indeterminate
            hud.bezelView.style = .solidColor
            hud.bezelView.color = UIColor.init(white: 0, alpha: 0.8)
            hud.label.textColor = UIColor.init(white: 1, alpha: 0.8)
            hud.detailsLabel.textColor = UIColor.init(white: 1, alpha: 0.8)
            hud.label.text = "Loading";
            hud.detailsLabel.text = "blablabla...";
            hud.hide(animated: true, afterDelay: 3)
        }
        stackView.addArrangedButton("show text", controlEvents: .touchUpInside) { [unowned self] sender in
            UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = UIColor.init(white: 1, alpha: 0.8)
            MBProgressHUD.hide(for: view, animated: true)
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.isUserInteractionEnabled = false
            hud.mode = .text
            hud.bezelView.style = .solidColor
            hud.bezelView.color = UIColor.init(white: 0, alpha: 0.8)
            hud.label.textColor = UIColor.init(white: 1, alpha: 0.8)
            hud.detailsLabel.textColor = UIColor.init(white: 1, alpha: 0.8)
            hud.label.text = "Hello World ~";
            hud.detailsLabel.text = "blablabla...";
            hud.hide(animated: true, afterDelay: 3)
        }
        stackView.addArrangedButton("hide", controlEvents: .touchUpInside) { [unowned self] sender in
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
    
    // MARK: - ProgressHUD
    
    // https://github.com/relatedcode/ProgressHUD
    func test_ProgressHUD() {
        // stackView.addArrangedSeparator(withTitle: "ProgressHUD", color: view.tintColor, size: 13)
        // stackView.addArrangedButton("show(text)", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.show("Some text...")
        // }
        // stackView.addArrangedButton("showSucceed()", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.showSucceed()
        // }
        // stackView.addArrangedButton("showFailed()", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.showFailed()
        // }
        // stackView.addArrangedButton("showProgress(0.42)", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.showProgress(0.42)
        // }
        // stackView.addArrangedButton("show(icon: .heart)", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.show(icon: .heart)
        // }
        // stackView.addArrangedButton("dismiss", controlEvents: .touchUpInside) { sender in
        //     ProgressHUD.dismiss()
        // }
    }

}
