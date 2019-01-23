//
//  CustomTabItem.swift
//  1Ramp
//
//  Created by Ankit Kumar on 23/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class CustomTabItem: UIView{
    
    var selected: Bool?
    var selectedIcon: UIImage?
    var unSelectedIcon: UIImage?
    
    var tabIcon : UIImageView={
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var iconHeightContraint: NSLayoutConstraint?
    var iconWidthContraint: NSLayoutConstraint?
    
    override func layoutSubviews() {
        setupViews()
    }
    
    fileprivate func setupViews(){
        addSubview(tabIcon)
        tabIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tabIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconHeightContraint = tabIcon.heightAnchor.constraint(equalToConstant: 28)
        iconWidthContraint = tabIcon.widthAnchor.constraint(equalToConstant: 28)
        iconHeightContraint?.isActive = true
        iconWidthContraint?.isActive = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTabTap)))
    }
    
    @objc func handleTabTap(_ sender: UITapGestureRecognizer){
        if delegate != nil && tabId != nil{
            delegate?.onTabPressed(tabId: tabId!)
        }
    }
    
    public func setSelectedIcon(iconName: String){
        self.selectedIcon = UIImage(named: iconName)
    }
    
    public func setUnSelectedIcon(iconName: String){
        self.unSelectedIcon = UIImage(named: iconName)
    }
    
    public func setSelected(selected: Bool){
        self.selected = selected
        if selected{
            tabIcon.image = selectedIcon
        }else{
            tabIcon.image = unSelectedIcon
        }
    }
    
    public func setTabId(tabId: Int){
        self.tabId = tabId
    }
    
    var tabId: Int?
    var delegate: CustomTabDelegate?
}
