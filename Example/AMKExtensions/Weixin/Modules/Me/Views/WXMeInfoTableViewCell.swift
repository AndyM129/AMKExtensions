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
        profileImageView.image = UIImage(color: UIColor.lightGray, size: CGSize(width: 30, height: 30))
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
        qrcodeButton.setImage(UIImage(color: WXAppearance.imageBackgroundColor, size: CGSize(width: 17, height: 17))?.byRoundCornerRadius(3), for: .normal)
        contentView.addSubview(qrcodeButton)
        return qrcodeButton
    }()
    
    lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView.init()
        arrowImageView.image = WXAppearance.menuItemArrowImage
        arrowImageView.contentMode = .scaleAspectFit
        contentView.addSubview(arrowImageView)
        return arrowImageView
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
        
        //according to apple super should be called at end of method
        super.updateConstraints()
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods


}
