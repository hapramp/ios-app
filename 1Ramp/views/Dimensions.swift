//
//  Dimensions.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
struct Dimensions {
    static let navigationBarHeight: CGFloat = 56
    
    class InterestViewInSelectionController {
        //For ContainerView
        static let columns: CGFloat = 3
        static let horizontalSpacing: CGFloat = 4
        static let verticalSpacing: CGFloat = 8
        
        //For Items
        static let width: CGFloat = 108
        static let height: CGFloat = 128
        static let circularViewPadding: CGFloat = 8
        static let imageIconDimension: CGFloat = 32
        static let textSize: CGFloat = 16
        static let textHeight: CGFloat = 18
        
        //Provides Height for InterestView Parent Container
        static var interestContainerViewWidth: CGFloat = {
            return columns * (horizontalSpacing + width + horizontalSpacing)
        }()
        
        //Provides Width for InterestView Parent Container
        static func interestContainerHeightFor(items: Int) -> CGFloat{
            let extraRow = (items % Int(columns) == 0) ? 0 : 1
            let rows = (items/Int(columns)) + extraRow
            return CGFloat(rows) * (verticalSpacing + height + verticalSpacing)
        }
    }
    
    class InterestViewInHorizontalFilterView{
        
        //For FlowLayout
        static let leftInset:CGFloat = 8
        static let topInset:CGFloat = 4
        static let rightInset:CGFloat = 8
        static let bottomInset:CGFloat = 2
        
        //For Items
        static let width: CGFloat = 70
        static let height: CGFloat = 84
        static let circularViewPadding: CGFloat = 8
        static let imageIconDimension: CGFloat = 28
        static let textSize: CGFloat = 12
        static let textHeight: CGFloat = 8
        
        static func itemCellHeight() -> CGFloat{
            return topInset + height + bottomInset
        }
        
        static func itemCellWidth() -> CGFloat{
            return 2 + width + 2
        }
        
        //Tip: the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.
        //So add some extra space: 8
        static func collectionViewHeight() -> CGFloat{
            return topInset + height + bottomInset + 8
        }
    }
    
    class FeedListView{
        static let defaultHeight: CGFloat = 480
        static let width = UIScreen.main.bounds.width
        
        static func getWidth() -> CGFloat{
            return width
        }
    }
    
    class FeedCollectionViewCell{
        static let titleFontSize: CGFloat = 22
        static let snippetFontSize: CGFloat = 16
        static let avatarHeight: CGFloat = 48
        static let topEdgeToAvatarSpace : CGFloat = 12
        static let avatarToFeedImageSpace : CGFloat = 12
        static let defaultFeedImageHeight : CGFloat = CGFloat(ImageHelper.getEstimatedImageHeight())
        static let feedImageToTitleSpace : CGFloat = 4
        static let titleToSnippetSpace : CGFloat = 0
        static let snippetToBottomEdgeSpace : CGFloat = 8
        
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
            
            var feedImageHeight : CGFloat = 0
            let jsonMetadata = feed.jsonMetadata
            switch jsonMetadata {
            case .metadata(let metadata):
                if let feed_images = metadata.image{
                    if feed_images.count>0 {
                        if feed_images[0].count>0 {
                            //print("Valid Url \(feed_images[0])")
                         feedImageHeight = defaultFeedImageHeight
                        }
                    }
                }
            }
            
            let height1 = topEdgeToAvatarSpace +
            avatarHeight +
            avatarToFeedImageSpace +
            feedImageHeight +
            feedImageToTitleSpace
            
            let height2 =
                titleHeight +
                titleToSnippetSpace +
                snippetHeight +
                snippetToBottomEdgeSpace
            
            return height1 + height2
        }
    }
}
