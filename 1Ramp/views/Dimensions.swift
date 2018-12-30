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
    
    class InterestView {
        static let columns: CGFloat = 3
        static let padding: CGFloat = 4
        static let dimension: CGFloat = 108
        static let iconDimension: CGFloat = 32
        
        static var interestContainerViewWidth: CGFloat = {
            return columns * (padding + dimension + padding)
        }()
        
        static func interestContainerHeightFor(items: Int) -> CGFloat{
            let extraRow = (items % Int(columns) == 0) ? 0 : 1
            let rows = (items/Int(columns)) + extraRow
            return CGFloat(rows) * (padding + dimension + padding)
        }
    }
}
