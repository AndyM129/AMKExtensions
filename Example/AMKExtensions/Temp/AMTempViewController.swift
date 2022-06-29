//
//  AMTempViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/29.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SnapKit
import AMKExtensions

class AMTempViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AMTempViewController"
        view.backgroundColor = view.backgroundColor ?? UIColor.white
        
        test_01()
    }
    
    func test_01() {
        
        let label = UILabel()
        label.text = "一二三四五六七八九十0123456789"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1;
        label.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIApplication.shared.statusBarFrame.size.height + navigationController!.navigationBar.frame.size.height)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
        
        let attributedString = NSMutableAttributedString(string: "一二三四五六七八九十0123456789")
        attributedString.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
        ], range: attributedString.amke_range)
        label.attributedText = attributedString
    }
    
}

