//
//  WXMessagesItemViewModel.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/6/30.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

typealias WXMessagesItemViewModelClickedBlock = (_ viewModel: WXMessagesItemViewModel)->Void

typealias WXMessagesSection = [WXMessagesItemViewModel]

/// 消息 - item
class WXMessagesItemViewModel: NSObject {
    
    // MARK: - Deinit Messagesthods
    
    deinit {
        
    }
    
    // MARK: - Init Messagesthods
    
    /// 随机生成一个
    convenience init(randomWithClickedBlock clickedBlock: WXMessagesItemViewModelClickedBlock?) {
        let title = String.wx_randomUsername()
        let subtitle = "blablablabla~~~"
        let updateDate = Date(timeIntervalSinceNow: TimeInterval.random(in: 0...999999) * -1)
        let iconImage = UIImage.wx_randomProfileImage()
        self.init(title: title, subtitle: subtitle, updateDate: updateDate, iconImage: iconImage, clickedBlock: clickedBlock)
        self.isMute = Bool.random()
    }
    
    init(title: String?, subtitle: String?, updateDate: Date?, iconImage: UIImage?, clickedBlock: WXMessagesItemViewModelClickedBlock?) {
        self.title = title
        self.subtitle = subtitle
        self.updateDate = updateDate
        self.iconImage = iconImage ?? UIImage.wx_menuItemIconImage()
        self.clickedBlock = clickedBlock
    }
    
    // MARK: - Getters & Setters
    
    var title: String?
    
    var subtitle: String?
    
    var updateDate: Date?
    
    var iconImage: UIImage?
    
    var clickedBlock: WXMessagesItemViewModelClickedBlock?
    
    var isMute: Bool = false
    
    var isPinned: Bool = false
    
    var updateDateString: String? {
        if updateDate == nil {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: updateDate!)
    }
    
    // MARK: - Data & Networking
    
    // MARK: - Public Messagesthods
    
    // MARK: - Private Messagesthods
    
    // MARK: - Notifications
    
    // MARK: - Protocol
    
    // MARK: - Helper Messagesthods
        
}
