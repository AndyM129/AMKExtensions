//
//  AMTSettingsIconTableViewCell.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/6.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit
import SnapKit

class AMTSettingIconTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = AMTAppearance.viewBackgroundColor
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.image = UIImage(named: "amt_setting_icon")
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        return iconImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let application = UIApplication.shared
        
        let titleLabel = UILabel()
        titleLabel.text = "\(application.appBundleName!)"
        titleLabel.textColor = AMTAppearance.tintColor
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0;
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let application = UIApplication.shared
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "版本：\(application.appVersion!)+\(application.appBuildVersion!)"
        subtitleLabel.textColor = AMTAppearance.subtitleColor
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0;
        subtitleLabel.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(subtitleLabel)
        return subtitleLabel
    }()
        
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return tableView.height * 0.40
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.centerY).offset(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.width.equalTo(contentView).offset(-30)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.centerX.width.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.width.equalTo(contentView).offset(-30)
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
