//
//  FeedView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedView: BaseCustomUIView{
    
    static let mockColor = UIColor.init(white: 0, alpha: 0.15)
    
    let wrapper: UIView = {
        let sc = UIView()
        sc.layer.borderColor = mockColor.cgColor
        sc.layer.borderWidth = 1
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let userAvatar: UIImageView = {
        let am = UIImageView()
        am.image = UIImage(named: "kajal")
        am.layer.cornerRadius = 24
        am.contentMode = .scaleAspectFit
        am.layer.borderColor = UIColor.lightGray.cgColor
        am.layer.borderWidth = 1
        am.layer.masksToBounds = true
        am.translatesAutoresizingMaskIntoConstraints = false
        return am
    }()
    
    let username: UILabel = {
        let um = UILabel()
        um.text = "kajal"
        um.font = UIFont.boldSystemFont(ofSize: 18)
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let timestamp: UILabel = {
        let um = UILabel()
        um.text = "| 1 day ago"
        um.font = UIFont.systemFont(ofSize: 16)
        um.textColor = Colors.black54
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let interest1Mock: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.layer.cornerRadius = 8
        um.layer.masksToBounds = true
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let interest2Mock: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.layer.cornerRadius = 8
        um.layer.masksToBounds = true
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let feedImage: UIImageView = {
        let um = UIImageView()
        um.image = UIImage(named: "samantha")
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let feedTitle: UILabel = {
        let um = UILabel()
        um.textColor = Colors.primaryColorDark
        um.text = "On day of FilmFare"
        um.font = UIFont.systemFont(ofSize: 22)
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let feedSpinnet: UITextView = {
        let um = UITextView()
        um.isEditable = false
        um.textColor = Colors.black87
        um.textContainer.maximumNumberOfLines = 4
        um.textContainer.lineBreakMode = .byWordWrapping
        um.contentInset = UIEdgeInsets(top: -8, left: -4, bottom: 0, right: 0)
        um.font = UIFont.systemFont(ofSize: 16)
        um.text = "Filmfare is an English-language, tabloid-sized magazine about Hindi-language cinema, popularly known as Bollywood. Established in 1952, the magazine is published by Worldwide Media, a subsidiary of The Times Group, India's largest media services conglomerate."
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let mockText2: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let mockText3: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    fileprivate func layoutMockContainer(){
        
        addSubview(wrapper)
        wrapper.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        wrapper.topAnchor.constraint(equalTo: topAnchor).isActive = true
        wrapper.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        wrapper.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        wrapper.addSubview(userAvatar)
        userAvatar.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 12).isActive = true
        userAvatar.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 12).isActive = true
        userAvatar.widthAnchor.constraint(equalToConstant: 48).isActive = true
        userAvatar.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        wrapper.addSubview(username)
        username.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 16).isActive = true
        username.leftAnchor.constraint(equalTo: userAvatar.rightAnchor, constant: 12).isActive = true
        //username.widthAnchor.constraint(equalToConstant: 108).isActive = true
        //username.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        wrapper.addSubview(timestamp)
        timestamp.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 16).isActive = true
        timestamp.leftAnchor.constraint(equalTo: username.rightAnchor, constant: 8).isActive = true
//        timestamp.widthAnchor.constraint(equalToConstant: 64).isActive = true
//        timestamp.heightAnchor.constraint(equalToConstant: 16).isActive = true
 
        wrapper.addSubview(feedImage)
        feedImage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 12).isActive = true
        feedImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        feedImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        feedImage.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        wrapper.addSubview(feedTitle)
        feedTitle.topAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: 16).isActive = true
        feedTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        //feedTitle.widthAnchor.constraint(equalToConstant: 196).isActive = true
        //feedTitle.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        wrapper.addSubview(feedSpinnet)

        feedSpinnet.topAnchor.constraint(equalTo: feedTitle.bottomAnchor, constant: 8).isActive = true
        feedSpinnet.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        feedSpinnet.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: -16).isActive = true
        feedSpinnet.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -8).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutMockContainer()
    }
}