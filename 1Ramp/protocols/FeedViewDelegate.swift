//
//  FeedViewDelegate.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

protocol FeedViewDelegate {
    func onImageHeightChanged(to: CGFloat, atIndex: Int) -> ()
}
