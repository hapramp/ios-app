//
//  PlusTabItem.swift
//  1Ramp
//
//  Created by Ankit Kumar on 23/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class PlusTabItem: UIView {
    var selected: Bool?
    
    var container: UIView = {
        let container = UIView()
        container.backgroundColor = Colors.primaryColor
        container.layer.cornerRadius = 22
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var tabIcon : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: AssetsUtil.WhitePlus)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var iconHeightContraint: NSLayoutConstraint?
    var iconWidthContraint: NSLayoutConstraint?
    
    fileprivate func setupViews(){
        addSubview(container)
        container.addSubview(tabIcon)
        
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 44).isActive = true
        container.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        tabIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        tabIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        tabIcon.heightAnchor.constraint(equalToConstant: 18).isActive = true
        tabIcon.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTabTap)))
    }
    
    @objc func handleTabTap(){
        if delegate != nil && tabId != nil{
            delegate?.onTabPressed(tabId: tabId!)
        }
    }
    
    public func setDimension(heightWidth: CGFloat){
        iconWidthContraint?.isActive = false
        iconWidthContraint?.constant = heightWidth
        iconHeightContraint?.constant = heightWidth
        iconWidthContraint?.isActive = true
    }
    
    public func setTabId(tabId: Int){
        self.tabId = tabId
    }
    
    var tabId: Int?
    var delegate: CustomTabDelegate?
}
