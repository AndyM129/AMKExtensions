//
//  WXMeInfoTableViewCell.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

/// 我 - 信息
class WXMeInfoTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView.init()
        profileImageView.layer.cornerRadius = 10
        profileImageView.layer.masksToBounds = true
        profileImageView.image = UIImage.wx_image(size: 100)
        profileImageView.contentMode = .scaleAspectFit
        contentView.addSubview(profileImageView)
        return profileImageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "一二三四五六七八九十0123456789"
        usernameLabel.textColor = UIColor.black
        usernameLabel.textAlignment = .left
        usernameLabel.numberOfLines = 1;
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        contentView.addSubview(usernameLabel)
        return usernameLabel
    }()
    
    lazy var userIdLabel: UILabel = {
        let userIdLabel = UILabel()
        userIdLabel.text = "一二三四五六七八九十0123456789"
        userIdLabel.textColor = UIColor(red:0.45, green:0.45, blue:0.45, alpha:1.00)
        userIdLabel.textAlignment = .left
        userIdLabel.numberOfLines = 1;
        userIdLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(userIdLabel)
        return userIdLabel
    }()
    
    lazy var qrcodeButton: UIButton = {
        let qrcodeButton = UIButton(type: .custom)
        qrcodeButton.setImage(UIImage.wx_iconImage(size: 17), for: .normal)
        contentView.addSubview(qrcodeButton)
        return qrcodeButton
    }()
    
    lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView.init()
        arrowImageView.image = UIImage.wx_menuItemArrowImage()
        arrowImageView.contentMode = .scaleAspectFit
        contentView.addSubview(arrowImageView)
        return arrowImageView
    }()
    
    lazy var stateButton: UIButton = {
        let stateButton = UIButton(type: .custom)
        stateButton.layer.cornerRadius = 12
        stateButton.layer.borderColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.00).cgColor
        stateButton.layer.borderWidth = 1
        stateButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        stateButton.setImage(UIImage.wx_iconImage(size: 12), for: .normal)
        stateButton.setTitle("状态", for: .normal)
        stateButton.setTitleColor(UIColor(red:0.54, green:0.54, blue:0.54, alpha:1.00), for: .normal)
        stateButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: -3)
        contentView.addSubview(stateButton)
        return stateButton
    }()
    
    lazy var friendsStateButton: UIButton = {
        let friendsStateButton = UIButton(type: .custom)
        friendsStateButton.layer.cornerRadius = 12
        friendsStateButton.layer.borderColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.00).cgColor
        friendsStateButton.layer.borderWidth = 1
        friendsStateButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        friendsStateButton.setImage(UIImage.wx_iconImage(size: 12), for: .normal)
        friendsStateButton.setTitle("1个朋友", for: .normal)
        friendsStateButton.setTitleColor(UIColor(red:0.54, green:0.54, blue:0.54, alpha:1.00), for: .normal)
        friendsStateButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: -3)
        contentView.addSubview(friendsStateButton)
        return friendsStateButton
    }()
    
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return UIApplication.shared.statusBarFrame.height + 185
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(63)
            make.height.equalTo(63)
            make.left.equalTo(contentView).offset(15)
            make.centerY.equalTo(contentView).offset(UIApplication.shared.statusBarFrame.height / 2)
        }
        usernameLabel.snp.makeConstraints { make in
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-10)
            make.height.equalTo(profileImageView).multipliedBy(0.5)
            make.top.equalTo(profileImageView)
        }
        userIdLabel.snp.makeConstraints { make in
            make.left.equalTo(usernameLabel)
            make.right.lessThanOrEqualTo(qrcodeButton.snp.left).offset(-10)
            make.height.equalTo(profileImageView).multipliedBy(0.5)
            make.bottom.equalTo(profileImageView)
        }
        qrcodeButton.snp.makeConstraints { make in
            make.width.equalTo(17)
            make.height.equalTo(17)
            make.right.equalTo(arrowImageView.snp.left).offset(-10)
            make.centerY.equalTo(arrowImageView)
        }
        arrowImageView.snp.makeConstraints { make in
            make.size.equalTo(WXAppearance.menuItemArrowImageSize)
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(userIdLabel)
        }
        stateButton.snp.makeConstraints { make in
            make.left.equalTo(usernameLabel)
            make.width.equalTo(60)
            make.height.equalTo(stateButton.layer.cornerRadius * 2)
            make.top.equalTo(profileImageView.snp.bottom).offset(5)
        }
        friendsStateButton.snp.makeConstraints { make in
            make.left.equalTo(stateButton.snp.right).offset(8)
            make.width.equalTo(80)
            make.height.equalTo(friendsStateButton.layer.cornerRadius * 2)
            make.top.equalTo(stateButton)
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
