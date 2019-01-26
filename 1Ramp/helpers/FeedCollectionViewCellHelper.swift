//
//  FeedCollectionViewCell+helpers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedCollectionViewCellHelper{
    //fixed values
    static let avatarHeight: CGFloat = 48
    static let topAvatarSpace : CGFloat = 12
    static let avatarImageSpace : CGFloat = 12
    static let imageHeight : CGFloat = 256
    static let imageTitleSpace : CGFloat = 16
    static let titleSnippetSpace : CGFloat = 8
    static let bottomSpace : CGFloat = 12
    
    static func calculateViewHeightFor(feed: FeedModel) -> CGFloat{
        //calculate title Height
        let width = UIScreen.main.bounds.width
        
        let titleHeight : CGFloat = UITextView.calculateHeightOfText(string: feed.title, font: UIFont.systemFont(ofSize: 22), width: width)
        
        //calculate snippetHeight
        let feedSpinnetFont = UIFont.systemFont(ofSize: 16)
        // keep max 4 lines
        let maxHeight: CGFloat = feedSpinnetFont.lineHeight * 5
        let snippetHeight : CGFloat = min(
            UITextView.calculateHeightOfText(string: feed.body, font: feedSpinnetFont, width: width)
            ,maxHeight)
        
        let viewTotalHeight = topAvatarSpace +
            avatarHeight +
            avatarImageSpace +
            imageHeight +
            imageTitleSpace +
            titleHeight +
            titleSnippetSpace +
            snippetHeight +
        bottomSpace
        
        return viewTotalHeight
    }
}
