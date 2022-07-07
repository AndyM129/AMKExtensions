//
//  AMTSettingSwitchTableViewCell.swift
//  AMKExtensions
//
//  Created by 孟昕欣 on 2022/7/7.
//  Copyright © 2022 https://github.com/AndyM129. All rights reserved.
//

import UIKit

class AMTSettingSwitchTableViewCell: UITableViewCell {

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
        accessoryView = accessorySwitch
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Getters & Setters
    
    lazy var accessorySwitch: UISwitch = {
        let accessorySwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
        accessorySwitch.onTintColor = AMTAppearance.tintColor
        accessorySwitch.isOn = UserDefaults.standard.bool(forKey: AMTConstants.flexSwitchUserDefaultsKey)
//        flexSwitch.addBlock(for: .valueChanged) {[unowned flexSwitch] sender in
//            flexSwitch.isOn ? FLEXManager.shared.showExplorer() : FLEXManager.shared.hideExplorer()
//            UserDefaults.standard.set(flexSwitch.isOn, forKey: AMTConstants.flexSwitchUserDefaultsKey)
//        }
        return accessorySwitch
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
        
        //according to apple super should be called at end of method
        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        accessorySwitch.isOn = false
    }
    
    // MARK: - Action Methods
    
    // MARK: - Notifications
    
    // MARK: - KVO
    
    // MARK: - Protocols
    
    // MARK: - Helper Methods

}
