//
//  FeedItemCell.swift
//  1Ramp
//
//  Created by Ankit Kumar on 24/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell{
    
    var feed: FeedModel?{
        didSet{
            if let feed = feed{
                hideShimmer()
                feedView.setFeed(feed: feed)
            }else{
                showShimmer()
            }
        }
    }
    
    static let mockColor = UIColor.init(white: 0, alpha: 0.15)
    
    let shimmerView: FeedItemCellShimmerView = {
        let sc = FeedItemCellShimmerView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let feedView: FeedView = {
        let fv = FeedView()
        fv.translatesAutoresizingMaskIntoConstraints = false
        return fv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(shimmerView)
        addSubview(feedView)
        shimmerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shimmerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shimmerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shimmerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        feedView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        feedView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        feedView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        feedView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func showShimmer(){
        feedView.isHidden = true
        shimmerView.isHidden = false
        shimmerView.applyGradientMaskToMock()
    }
    
    public func hideShimmer(){
        shimmerView.isHidden = true
        feedView.isHidden = false
    }
}
