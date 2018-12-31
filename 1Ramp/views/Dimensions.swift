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
}
