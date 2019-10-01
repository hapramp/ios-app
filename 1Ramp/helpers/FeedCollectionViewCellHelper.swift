//
//  FeedCollectionViewCell+helpers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedCollectionViewCellHelper{
    
    static func calculateViewHeightFor(feed: FeedModel) -> CGFloat{
        //calculate title Height
        let width = UIScreen.main.bounds.width - 24
        //calculate snippetHeight
        let feedTitleFont = UIFont.systemFont(ofSize: Dimensions.FeedCollectionViewCell.titleFontSize)
        // keep max 4 lines
        let maxTitleHeight: CGFloat = feedTitleFont.lineHeight * 3
        
        let titleHeight : CGFloat = min(UITextView.calculateHeightOfText(string: feed.title, font: feedTitleFont, width: width), maxTitleHeight)
        
        //calculate snippetHeight
        let feedSpinnetFont = UIFont.systemFont(ofSize: Dimensions.FeedCollectionViewCell.snippetFontSize)
        // keep max 4 lines
        let maxSnippetHeight: CGFloat = feedSpinnetFont.lineHeight * 5
        let snippetHeight : CGFloat = min(
            UITextView.calculateHeightOfText(string: feed.body, font: feedSpinnetFont, width: width)
            ,maxSnippetHeight)
        let viewTotalHeight = Dimensions.FeedCollectionViewCell.topEdgeToAvatarSpace +
            Dimensions.FeedCollectionViewCell.avatarHeight +
            Dimensions.FeedCollectionViewCell.avatarToFeedImageSpace +
            0 +
            Dimensions.FeedCollectionViewCell.feedImageToTitleSpace +
            titleHeight +
            Dimensions.FeedCollectionViewCell.titleToSnippetSpace +
            snippetHeight +
       Dimensions.FeedCollectionViewCell.snippetToBottomEdgeSpace
        
        return viewTotalHeight
    }
}
