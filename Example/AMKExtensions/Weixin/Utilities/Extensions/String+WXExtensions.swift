//
//  String+WXExtensions.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import Foundation

private let surnames: [String] = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王"]
private let names: [String] = ["澄邈", "德泽", "海超", "海阳", "海荣", "海逸", "海昌", "瀚钰", "瀚文", "涵亮", "涵煦", "明宇", "涵衍"]

extension String {
    
    /// 随机一个用户名
    static func wx_randomUsername() -> String {
        let surname = surnames[Int(arc4random()) % surnames.count]
        let name = names[Int(arc4random()) % names.count]
        return "\(surname)\(name)"
    }
    
}
