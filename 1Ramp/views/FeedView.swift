//
//  FeedView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import SDWebImage
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
        am.image = UIImage(named: "b3")
        am.layer.cornerRadius = 24
        am.contentMode = .scaleAspectFill
        am.layer.borderColor = UIColor.lightGray.cgColor
        am.layer.borderWidth = 1
        am.layer.masksToBounds = true
        am.translatesAutoresizingMaskIntoConstraints = false
        return am
    }()
    
    let username: UILabel = {
        let um = UILabel()
        um.text = "Sweety Gupta"
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
        um.image = UIImage(named: "sweety")
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let feedTitle: UITextView = {
        let um = UITextView()
        um.textColor = Colors.primaryColorDark
        um.text = "On day of FilmFare"
        um.contentInset = UIEdgeInsets(top: -4, left: 0, bottom: 0, right: 0)
        um.isEditable = false
        um.isScrollEnabled = false
        um.font = UIFont.systemFont(ofSize: 22)
        um.translatesAutoresizingMaskIntoConstraints = false
        return um
    }()
    
    let feedSpinnet: UITextView = {
        let um = UITextView()
        um.isEditable = false
        um.textColor = Colors.black54
        um.isScrollEnabled = false
        um.textContainer.maximumNumberOfLines = 4
        um.textContainer.lineBreakMode = .byWordWrapping
        um.contentInset = UIEdgeInsets(top: -8, left: 0, bottom: 0, right: 0)
        um.font = UIFont.systemFont(ofSize: 16)
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
    
    var feedTitleHeightContraint: NSLayoutConstraint?
    
    fileprivate func layoutMockContainer(){
        addSubview(wrapper)
        wrapper.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wrapper.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wrapper.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wrapper.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //User Avatar
        wrapper.addSubview(userAvatar)
        userAvatar.topAnchor.constraint(equalTo: wrapper.topAnchor,
                                        constant: Dimensions.FeedCollectionViewCell.topEdgeToAvatarSpace)
            .isActive = true
        userAvatar.leftAnchor.constraint(equalTo: wrapper.leftAnchor,
                                         constant: 12)
            .isActive = true
        userAvatar.widthAnchor.constraint(equalToConstant: Dimensions.FeedCollectionViewCell.avatarHeight)
            .isActive = true
        userAvatar.heightAnchor.constraint(equalToConstant: Dimensions.FeedCollectionViewCell.avatarHeight)
            .isActive = true
        
        //User Name
        wrapper.addSubview(username)
        username.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 16).isActive = true
        username.leftAnchor.constraint(equalTo: userAvatar.rightAnchor, constant: 12).isActive = true
        
        wrapper.addSubview(timestamp)
        timestamp.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 16).isActive = true
        timestamp.leftAnchor.constraint(equalTo: username.rightAnchor, constant: 8).isActive = true
        
        wrapper.addSubview(feedImage)
        feedImage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor,
                                       constant: Dimensions.FeedCollectionViewCell.avatarToFeedImageSpace)
            .isActive = true
        feedImage.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 0).isActive = true
        feedImage.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: 0).isActive = true
        feedImage.heightAnchor.constraint(equalToConstant: Dimensions.FeedCollectionViewCell.feedImageHeight)
            .isActive = true
        
        wrapper.addSubview(feedTitle)
        feedTitle.topAnchor.constraint(equalTo: feedImage.bottomAnchor,
                                       constant: Dimensions.FeedCollectionViewCell.feedImageToTitleSpace)
            .isActive = true
        feedTitle.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 12).isActive = true
        feedTitle.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -12).isActive = true
        feedTitleHeightContraint = feedTitle.heightAnchor.constraint(equalToConstant: 48)
        
        wrapper.addSubview(feedSpinnet)
        feedSpinnet.topAnchor.constraint(equalTo: feedTitle.bottomAnchor, constant: Dimensions.FeedCollectionViewCell.titleToSnippetSpace).isActive = true
        feedSpinnet.leftAnchor.constraint(equalTo: wrapper.leftAnchor,
                                          constant: 12)
            .isActive = true
        feedSpinnet.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor,
                                            constant: -Dimensions.FeedCollectionViewCell.snippetToBottomEdgeSpace)
            .isActive = true
        feedSpinnet.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -12).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutMockContainer()
    }
    
    func setFeed(feed: FeedModel) -> () {
        feedTitle.text = feed.title
        username.text = feed.author
        feedSpinnet.text = feed.body
        timestamp.text = feed.created
        let avatar_url = URL(string: "https://steemitimages.com/u/\(feed.author)/avatar/large")
        let jsonMetadata = feed.jsonMetadata
        switch jsonMetadata {
        case .metadata(let metadata):
            if let feed_images = metadata.image{
                if feed_images.count>0 {
                    let feed_image_url = URL(string: feed_images[0])
                    feedImage.sd_setImage(with: feed_image_url, completed: nil)
                    break
                }
            }
        }
        userAvatar.sd_setImage(with: avatar_url, completed: nil)
    }
}
