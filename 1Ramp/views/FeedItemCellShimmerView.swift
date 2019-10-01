//
//  FeedItemCellShimmerView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class FeedItemCellShimmerView: BaseCustomUIView{
    
    let mockLayerContainer: FeedItemCellMock = {
        let sl = FeedItemCellMock()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    let shinyLayerContainer: FeedItemCellMock = {
        let sl = FeedItemCellMock()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //add one more layer of mockContainer
        addSubview(mockLayerContainer)
        mockLayerContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mockLayerContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mockLayerContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mockLayerContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // add constraints to shinyLayerContainer
        addSubview(shinyLayerContainer)
        shinyLayerContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shinyLayerContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shinyLayerContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shinyLayerContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func applyGradientMaskToMock(){
        let frame = shinyLayerContainer.frame
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor , UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.height, height: frame.height)
        
        //rotate 90 degree
        let degree = 90 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(degree, 0, 0, 1)
        
        shinyLayerContainer.layer.mask = gradientLayer
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        basicAnimation.duration = 1.5
        basicAnimation.repeatCount = Float.infinity
        basicAnimation.fromValue = -frame.width * 2
        basicAnimation.toValue = frame.width
        gradientLayer.add(basicAnimation, forKey: "none")
    }
}
