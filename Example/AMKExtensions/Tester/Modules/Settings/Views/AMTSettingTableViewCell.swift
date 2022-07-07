//
//  AMTSettingTableViewCell.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTSettingTableViewCell: UITableViewCell {

    // MARK: - Deinit
    
    deinit {
        
    }
    
    // MARK: - Init Methods
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = AMTAppearance.contentBackgroundColor
        selectedBackgroundView = UIView(frame: bounds)
        selectedBackgroundView?.backgroundColor = AMTAppearance.contentSelectedBackgroundColor
        textLabel?.textColor = AMTAppearance.titleColor
        detailTextLabel?.textColor = AMTAppearance.subtitleColor
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var badgeView: UIView = {
        let badgeView = UIView()
        badgeView.layer.backgroundColor = AMTAppearance.badgeColor.cgColor
        badgeView.layer.cornerRadius = 3
        detailTextLabel!.addSubview(badgeView)
        return badgeView
    }()
    
    // MARK: - Data & Networking
    
    // MARK: - Layout Subviews
    
    /// 行高
    static func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath, withData: Any?) -> CGFloat {
        return 50
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        badgeView.snp.remakeConstraints { make in
            make.width.height.equalTo(badgeView.layer.cornerRadius * 2)
            make.left.equalTo(detailTextLabel!.snp.right).offset(-1)
            make.centerY.equalTo(detailTextLabel!.snp.top)
        }
        
        //according to apple super should be called at end of method
        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        detailTextLabel?.text = nil
        badgeView.isHidden = true
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods

}
