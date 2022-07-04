//
//  WXContactsViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 我
class WXContactsViewModel: NSObject {

    // MARK: - Deinit Contactsthods
    
    deinit {
        
    }
    
    // MARK: - Init Contactsthods
    
    static func defaults() -> WXContactsViewModel {
        var sections: [WXContactsSection] = []
        sections.append([
            WXContactsItemViewModel(title: "新的朋友", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.91, green:0.60, blue:0.25, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXContactsItemViewModel(title: "仅聊天的朋友", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.91, green:0.60, blue:0.24, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXContactsItemViewModel(title: "群聊", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.22, green:0.73, blue:0.35, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXContactsItemViewModel(title: "标签", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.28, green:0.43, blue:0.90, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXContactsItemViewModel(title: "公众号", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.28, green:0.43, blue:0.90, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
            WXContactsItemViewModel(title: "企业微信联系人", iconImage: UIImage.wx_menuItemIconImage(color: UIColor(red:0.28, green:0.43, blue:0.80, alpha:1.00)), clickedBlock: { viewModel in
                
            }),
        ])
        sections.append([
            
        ])
        return WXContactsViewModel(sections: sections)
    }
    
    init(sections: [WXContactsSection]?) {
        self.sections = sections ?? []
    }
    
    // MARK: - Getters & Setters
    
    var sections: [WXContactsSection] = []
    
    var totalCount: Int = 0
        
    // MARK: - Data & Networking
    
    /// 请求数据
    func reloadData(completion: WXNetworkingCompletionBlock?) {
        // 模拟网络耗时
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1)) { [unowned self] in
            
            // 随机人名 & 头像，并加入列表
            var contacts: WXContactsSection = []
            let count = Int.random(in: 10...200)
            for _ in 0...count {
                contacts.append(WXContactsItemViewModel(randomWithClickedBlock: { viewModel in
                    
                }))
            }
            
            // 更新列表
            sections[1] = contacts
            totalCount = count
            
            // 执行回调 以刷新列表
            completion?(nil, nil)
        }
    }
    
    // MARK: - Public Contactsthods
    
    // MARK: - Private Contactsthods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Contactsthods

}
