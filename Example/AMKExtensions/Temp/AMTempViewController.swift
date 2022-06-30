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
import AMKStackView

class AMTempViewController: UIViewController, UITextFieldDelegate {
    
    lazy var stackView: AMKStackView = { [unowned self] in
        let stackView = AMKStackView.init(axis: .vertical, spacing: 20)!
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view).inset(UIApplication.shared.statusBarFrame.size.height + navigationController!.navigationBar.frame.size.height + 20)
            make.left.right.bottom.equalTo(view).inset(20)
        }
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AMTempViewController"
        view.backgroundColor = view.backgroundColor ?? UIColor.white
        
        //test_01()
        test_TextField()
    }
    
    // MARK: - test_01
    
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
        
        // ============================================================================================================
        
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.05)
        button.setTitle("Button Title", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.width.equalTo(view).inset(40)
            make.height.equalTo(40)
        }
        
        // ============================================================================================================
        
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // ============================================================================================================
        
        let textField = UITextField.init()
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .line
        view.addSubview(textField)
        
        
    }
    
    @objc func buttonClicked(sender: Any) {
        print("buttonClicked: \(sender)")
    }
    
    // MARK: - TextField
    
    func test_TextField() {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.textColor = UIColor.black
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = "placeholder ..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.delegate = self
        //textField.rightView = UIView(frame: CGRect.init(x: 0, y: 0, width: 10, height: 10))
        //textField.rightViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        //view.addSubview(textField)
        
        textField.height = 40
        stackView.addArrangedSubview(textField)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing: \(textField)")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField)")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing: \(textField)")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField)")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField: \(textField), shouldChangeCharactersIn: \(range), replacementString: \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear: \(textField)")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn: \(textField)")
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: -
    
    func test_tabBarItem() {
        tabBarItem.title = "Title"
        tabBarItem.image = UIImage(named: "xxx_tab_n")
        tabBarItem.selectedImage = UIImage(named: "xxx_tab_s")
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: -
    
    func test_alertController() {
        let title = "Title"
        let message = "Message"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Default", style: .default, handler: { alertAction in
            print("点击了：\(alertAction)")
        }))
        alertController.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: { alertAction in
            print("点击了：\(alertAction)")
        }))
        // alertController.addAction({
        //     UIAlertAction()
        // }())
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true)
    }
    
   
}

