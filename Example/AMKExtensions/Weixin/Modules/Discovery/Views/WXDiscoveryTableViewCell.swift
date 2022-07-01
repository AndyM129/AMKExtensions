//
//  WXDiscoveryTableViewCell.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SnapKit

class WXDiscoveryProfileImageView: UIImageView {
    var badgeView: UIView?
}

class WXDiscoveryTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView?.backgroundColor = WXAppearance.tableViewCellSelectedBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.image = UIImage.wx_menuItemIconImage()
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        return iconImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "一二三四五六七八九十0123456789"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1;
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    lazy var profileImageView: WXDiscoveryProfileImageView = {
        let profileImageView = WXDiscoveryProfileImageView.init()
        profileImageView.layer.cornerRadius = 5
        profileImageView.layer.masksToBounds = true
        profileImageView.image = UIImage.wx_image(size: 17)
        profileImageView.contentMode = .scaleAspectFit
        contentView.addSubview(profileImageView)
        
        profileImageView.badgeView = UIView()
        profileImageView.badgeView!.layer.cornerRadius = 3.5
        profileImageView.badgeView!.layer.backgroundColor = WXAppearance.tabBarItemBadgeColor.cgColor
        profileImageView.badgeView!.isHidden = true
        contentView.addSubview(profileImageView.badgeView!)
        return profileImageView
    }()
    
    lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView.init()
        arrowImageView.image = UIImage.wx_menuItemArrowImage()
        arrowImageView.contentMode = .scaleAspectFit
        contentView.addSubview(arrowImageView)
        return arrowImageView
    }()
        
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return 52
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(WXAppearance.menuItemIconImageSize)
            make.left.equalTo(contentView).offset(15)
            make.centerY.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.lessThanOrEqualTo(profileImageView.snp.left).inset(10)
            make.centerY.equalTo(contentView)
        }
        profileImageView.snp.makeConstraints { make in
            make.right.equalTo(arrowImageView.snp.left).offset(-10)
            make.width.height.equalTo(30)
            make.centerY.equalTo(contentView)
        }
        profileImageView.badgeView!.snp.makeConstraints { make in
            make.width.height.equalTo(7)
            make.centerX.equalTo(profileImageView.snp.right)
            make.centerY.equalTo(profileImageView.snp.top)
        }

        arrowImageView.snp.makeConstraints { make in
            make.size.equalTo(WXAppearance.menuItemArrowImageSize)
            make.right.equalTo(contentView).inset(15)
            make.centerY.equalTo(contentView)
        }
        
        //according to apple super should be called at end of method
        super.updateConstraints()
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods

}
