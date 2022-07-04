//
//  WXMessagesTableViewCell.swift
//  AMKExtensions_Example
//
//  Created by 孟昕欣 on 2022/7/1.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class WXMessagesTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.layer.cornerRadius = 8
        iconImageView.layer.masksToBounds = true
        iconImageView.image = UIImage(color: UIColor.lightGray, size: CGSize(width: 30, height: 30))
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
    
    lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "一二三四五六七八九十0123456789"
        subtitleLabel.textColor = UIColor(red:0.69, green:0.69, blue:0.69, alpha:1.00)
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 1;
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(subtitleLabel)
        return subtitleLabel
    }()
    
    lazy var updateDateLabel: UILabel = {
        let updateDateLabel = UILabel()
        updateDateLabel.text = "一二三四五六七八九十0123456789"
        updateDateLabel.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.00)
        updateDateLabel.textAlignment = .left
        updateDateLabel.numberOfLines = 1;
        updateDateLabel.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(updateDateLabel)
        return updateDateLabel
    }()
    
    lazy var muteImageView: UIImageView = {
        let muteImageView = UIImageView.init()
        muteImageView.image = UIImage.wx_iconImage(size: 11)
        muteImageView.contentMode = .scaleAspectFit
        contentView.addSubview(muteImageView)
        return muteImageView
    }()
    
    var isPinned: Bool = false {
        didSet {
            backgroundColor = isPinned ? WXAppearance.viewBackgroundColor : UIColor.white
        }
    }
    
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return 68
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.left.equalTo(contentView).offset(15)
            make.centerY.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.height.equalTo(iconImageView.snp.height).multipliedBy(0.5)
            make.top.equalTo(iconImageView)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.right.equalTo(contentView).offset(-10)
            make.height.equalTo(iconImageView.snp.height).multipliedBy(0.5)
            make.bottom.equalTo(iconImageView)
        }
        updateDateLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(60)
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(titleLabel)
        }
        muteImageView.snp.makeConstraints { make in
            make.size.equalTo(muteImageView.image!.size)
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(subtitleLabel)
        }
        
        //according to apple super should be called at end of method
        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods

}
