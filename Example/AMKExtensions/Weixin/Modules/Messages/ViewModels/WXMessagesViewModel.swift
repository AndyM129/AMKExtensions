//
//  WXMessagesViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 消息
class WXMessagesViewModel: NSObject {

    // MARK: - Deinit Messagesthods
    
    deinit {
        
    }
    
    // MARK: - Init Messagesthods
    
    static func defaults() -> WXMessagesViewModel {
        var sections: [WXMessagesSection] = []
        sections.append([
            WXMessagesItemViewModel(randomWithClickedBlock: nil),
            WXMessagesItemViewModel(randomWithClickedBlock: nil),
        ])
        return WXMessagesViewModel(sections: sections)
    }
    
    init(sections: [WXMessagesSection]?) {
        self.sections = sections ?? []
    }
    
    // MARK: - Getters & Setters
    
    var sections: [WXMessagesSection] = []
    
    var totalCount: Int = 0
        
    // MARK: - Data & Networking
    
    /// 请求数据
    func reloadData(completion: WXNetworkingCompletionBlock?) {
        // 模拟网络耗时
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1)) { [unowned self] in
            
            // 随机人名 & 头像，并加入列表
            var messages: WXMessagesSection = []
            let count = Int.random(in: 10...200)
            for index in 0...count {
                let itemViewModel = WXMessagesItemViewModel(randomWithClickedBlock: { viewModel in
                    
                })
                itemViewModel.isPinned = index < 3
                messages.append(itemViewModel)
            }

            // 更新列表
            sections[0] = messages
            totalCount = count
            
            // 执行回调 以刷新列表
            completion?(nil, nil)
        }
    }
    
    // MARK: - Public Messagesthods
    
    // MARK: - Private Messagesthods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Messagesthods

}
