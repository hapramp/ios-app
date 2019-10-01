//
//  HomeActionBarView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 23/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class HomeActionBarView: UIView{
    
    let searchButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notificationButtonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchButton: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: AssetsUtil.SearchIcon)
        return iv
    }()
   
    let homeButton: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: AssetsUtil.HaprampLogoIcon)
        return iv
    }()
    
    let notificationButton: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: AssetsUtil.NotificationIcon)
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        addSubview(searchButtonContainer)
        addSubview(notificationButtonContainer)
        
        //Search Icon
        searchButtonContainer.addSubview(searchButton)
        searchButtonContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        searchButtonContainer.widthAnchor.constraint(equalToConstant: 56).isActive = true
        searchButtonContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchButtonContainer.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        searchButton.centerXAnchor.constraint(equalTo: searchButtonContainer.centerXAnchor).isActive = true
        searchButton.centerYAnchor.constraint(equalTo: searchButtonContainer.centerYAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //home icon
        addSubview(homeButton)
        homeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        homeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        //Notification Icon
        
        notificationButtonContainer.addSubview(notificationButton)
        notificationButtonContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        notificationButtonContainer.widthAnchor.constraint(equalToConstant: 56).isActive = true
        notificationButtonContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        notificationButtonContainer.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        notificationButton.centerXAnchor.constraint(equalTo: notificationButtonContainer.centerXAnchor).isActive = true
        notificationButton.centerYAnchor.constraint(equalTo: notificationButtonContainer.centerYAnchor).isActive = true
        notificationButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        notificationButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
