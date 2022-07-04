//
//  AMTOpenUrlTableViewCell.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/4.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTOpenUrlTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView?.backgroundColor = AMTAppearance.tableViewCellSelectedBackgroundColor
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
        
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
    
    
    
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(15)
            make.right.equalTo(contentView).offset(-15)
            make.centerY.equalTo(contentView)
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
