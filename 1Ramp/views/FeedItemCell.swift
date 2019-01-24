//
//  FeedItemCell.swift
//  1Ramp
//
//  Created by Ankit Kumar on 24/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedItemCell: BaseCustomUIView{
    
    static let mockColor = UIColor.init(white: 0, alpha: 0.15)
    
    let shimmerContainer: UIView = {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(shimmerContainer)
        
        shimmerContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shimmerContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shimmerContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shimmerContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        shimmerContainer.addSubview(avatarMock)
        avatarMock.topAnchor.constraint(equalTo: shimmerContainer.topAnchor, constant: 12).isActive = true
        avatarMock.leftAnchor.constraint(equalTo: shimmerContainer.leftAnchor, constant: 12).isActive = true
        avatarMock.widthAnchor.constraint(equalToConstant: 48).isActive = true
        avatarMock.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        shimmerContainer.addSubview(usernameMock)
        usernameMock.topAnchor.constraint(equalTo: shimmerContainer.topAnchor, constant: 16).isActive = true
        usernameMock.leftAnchor.constraint(equalTo: avatarMock.rightAnchor, constant: 12).isActive = true
        usernameMock.widthAnchor.constraint(equalToConstant: 108).isActive = true
        usernameMock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        shimmerContainer.addSubview(timeMock)
        timeMock.topAnchor.constraint(equalTo: shimmerContainer.topAnchor, constant: 16).isActive = true
        timeMock.leftAnchor.constraint(equalTo: usernameMock.rightAnchor, constant: 12).isActive = true
        timeMock.widthAnchor.constraint(equalToConstant: 64).isActive = true
        timeMock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        shimmerContainer.addSubview(interest1Mock)
        interest1Mock.topAnchor.constraint(equalTo: usernameMock.bottomAnchor, constant: 8).isActive = true
        interest1Mock.leftAnchor.constraint(equalTo: avatarMock.rightAnchor, constant: 12).isActive = true
        interest1Mock.widthAnchor.constraint(equalToConstant: 72).isActive = true
        interest1Mock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        shimmerContainer.addSubview(interest2Mock)
        interest2Mock.topAnchor.constraint(equalTo: usernameMock.bottomAnchor, constant: 8).isActive = true
        interest2Mock.leftAnchor.constraint(equalTo: interest1Mock.rightAnchor, constant: 12).isActive = true
        interest2Mock.widthAnchor.constraint(equalToConstant: 64).isActive = true
        interest2Mock.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        shimmerContainer.addSubview(mockImage)
        mockImage.topAnchor.constraint(equalTo: avatarMock.bottomAnchor, constant: 16).isActive = true
        mockImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        mockImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        mockImage.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        shimmerContainer.addSubview(mockTitle)
        mockTitle.topAnchor.constraint(equalTo: mockImage.bottomAnchor, constant: 16).isActive = true
        mockTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockTitle.widthAnchor.constraint(equalToConstant: 196).isActive = true
        mockTitle.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        shimmerContainer.addSubview(mockText)
        mockText.topAnchor.constraint(equalTo: mockTitle.bottomAnchor, constant: 18).isActive = true
        mockText.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText.widthAnchor.constraint(equalToConstant: 280).isActive = true
        mockText.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        shimmerContainer.addSubview(mockText2)
        mockText2.topAnchor.constraint(equalTo: mockText.bottomAnchor, constant: 8).isActive = true
        mockText2.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText2.widthAnchor.constraint(equalToConstant: 256).isActive = true
        mockText2.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        shimmerContainer.addSubview(mockText3)
        mockText3.topAnchor.constraint(equalTo: mockText2.bottomAnchor, constant: 8).isActive = true
        mockText3.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        mockText3.widthAnchor.constraint(equalToConstant: 360).isActive = true
        mockText3.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    public func applyGradientMaskToMock(){
        let frame = shimmerContainer.frame
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor , UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
        
        //rotate 45 degree (-ve)
        let degree = 90 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(degree, 0, 0, 1)
        
        shimmerContainer.layer.mask = gradientLayer
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        basicAnimation.duration = 4
        basicAnimation.repeatCount = Float.infinity
        basicAnimation.fromValue = -frame.width * 2
        basicAnimation.toValue = frame.width
        gradientLayer.add(basicAnimation, forKey: "none")
    }
}
