//
//  FeedListScrollDelegate.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

protocol FeedListDelegate {
    func onFeedListScrolled(inUpDirection: Bool) -> ()
}
