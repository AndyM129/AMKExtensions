//
//  AMKJsonToDictViewController.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Json 与 Object 互转
class AMJsonAndObjectViewController: AMStackViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Json 与 Object 互转"
        
        stackView.addArrangedSeparator(withTitle: "基于 JSONSerialization", color: view.tintColor, size: 13)
        stackView.addArrangedButton("JsonString 转 Dict", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"temperature\":\"28\",\"humidity\":\"88\",\"info\":\"晴\",\"wid\":\"00\",\"direct\":\"东南风\",\"power\":\"3级\",\"aqi\":\"35\"}"
            let jsonData = jsonString.data(using: String.Encoding.utf8)
            let dict = try? JSONSerialization.jsonObject(with: jsonData ?? Data(), options: .mutableContainers)
            print("\(jsonString)\n=> \(String(describing: dict))\n\n\n")
        }
        
        stackView.addArrangedButton("Dict 转 JsonString", controlEvents: .touchUpInside) { sender in
            let object = ["AAA": 111, "BBB": 222, "CCC": 333]
            let jsonData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            let jsonString = String(data: jsonData ?? Data(), encoding: .utf8)
            print("\(object)\n=> \(String(describing: jsonString))\n\n\n")
        }
        
        // https://github.com/SwiftyJSON/SwiftyJSON
        stackView.addArrangedSeparator(withTitle: "基于 SwiftyJSON", color: view.tintColor, size: 13)
        stackView.addArrangedButton("JsonString 转 Dict", controlEvents: .touchUpInside) { sender in
            let jsonString = "{\"temperature\":\"28\",\"humidity\":\"88\",\"info\":\"晴\",\"wid\":\"00\",\"direct\":\"东南风\",\"power\":\"3级\",\"aqi\":\"35\"}"
            let dict = JSON(parseJSON: jsonString)
            print("\(jsonString)\n=> \(String(describing: dict))\n\n\n")
        }
        stackView.addArrangedButton("Dict 转 JsonString", controlEvents: .touchUpInside) { sender in
            let object = ["AAA": 111, "BBB": 222, "CCC": 333]
            let json = JSON(object)
            let jsonString = json.rawString()
            print("\(object)\n=> \(String(describing: jsonString))\n\n\n")
        }
        
    }

}
