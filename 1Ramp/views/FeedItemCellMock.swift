//
//  FeedItemCellMock.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedItemCellMock: BaseCustomUIView {
    
    static let mockColor = UIColor.init(white: 0, alpha: 0.1)
    
    let mockContainer: UIView = {
        let sc = UIView()
        sc.layer.borderColor = mockColor.cgColor
        sc.layer.borderWidth = 1
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let avatarMock: UIView = {
        let am = UIView()
        am.backgroundColor = mockColor
        am.layer.cornerRadius = 24
        am.layer.masksToBounds = true
        am.translatesAutoresizingMaskIntoConstraints = false
        return am
    }()
    
    let usernameMock: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let timeMock: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
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
    
    let mockImage: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let mockTitle: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let mockText: UIView = {
        let um = UIView()
        um.backgroundColor = mockColor
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
        
        addSubview(mockContainer)
        mockContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mockContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mockContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mockContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mockContainer.addSubview(avatarMock)
        avatarMock.topAnchor.constraint(equalTo: mockContainer.topAnchor, constant: 12).isActive = true
        avatarMock.leftAnchor.constraint(equalTo: mockContainer.leftAnchor, constant: 12).isActive = true
        avatarMock.widthAnchor.constraint(equalToConstant: 48).isActive = true
        avatarMock.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        mockContainer.addSubview(usernameMock)
        usernameMock.topAnchor.constraint(equalTo: mockContainer.topAnchor, constant: 16).isActive = true
        usernameMock.leftAnchor.constraint(equalTo: avatarMock.rightAnchor, constant: 12).isActive = true
        usernameMock.widthAnchor.constraint(equalToConstant: 108).isActive = true
        usernameMock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mockContainer.addSubview(timeMock)
        timeMock.topAnchor.constraint(equalTo: mockContainer.topAnchor, constant: 16).isActive = true
        timeMock.leftAnchor.constraint(equalTo: usernameMock.rightAnchor, constant: 12).isActive = true
        timeMock.widthAnchor.constraint(equalToConstant: 64).isActive = true
        timeMock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mockContainer.addSubview(interest1Mock)
        interest1Mock.topAnchor.constraint(equalTo: usernameMock.bottomAnchor, constant: 8).isActive = true
        interest1Mock.leftAnchor.constraint(equalTo: avatarMock.rightAnchor, constant: 12).isActive = true
        interest1Mock.widthAnchor.constraint(equalToConstant: 72).isActive = true
        interest1Mock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mockContainer.addSubview(interest2Mock)
        interest2Mock.topAnchor.constraint(equalTo: usernameMock.bottomAnchor, constant: 8).isActive = true
        interest2Mock.leftAnchor.constraint(equalTo: interest1Mock.rightAnchor, constant: 12).isActive = true
        interest2Mock.widthAnchor.constraint(equalToConstant: 64).isActive = true
        interest2Mock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mockContainer.addSubview(mockImage)
        mockImage.topAnchor.constraint(equalTo: avatarMock.bottomAnchor, constant: 16).isActive = true
        mockImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        mockImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        mockImage.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        mockContainer.addSubview(mockTitle)
        mockTitle.topAnchor.constraint(equalTo: mockImage.bottomAnchor, constant: 16).isActive = true
        mockTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockTitle.widthAnchor.constraint(equalToConstant: 196).isActive = true
        mockTitle.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        mockContainer.addSubview(mockText)
        mockText.topAnchor.constraint(equalTo: mockTitle.bottomAnchor, constant: 18).isActive = true
        mockText.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText.widthAnchor.constraint(equalToConstant: 280).isActive = true
        mockText.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        mockContainer.addSubview(mockText2)
        mockText2.topAnchor.constraint(equalTo: mockText.bottomAnchor, constant: 8).isActive = true
        mockText2.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText2.widthAnchor.constraint(equalToConstant: 256).isActive = true
        mockText2.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        mockContainer.addSubview(mockText3)
        mockText3.topAnchor.constraint(equalTo: mockText2.bottomAnchor, constant: 8).isActive = true
        mockText3.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText3.widthAnchor.constraint(equalToConstant: 360).isActive = true
        mockText3.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutMockContainer()
    }
}
