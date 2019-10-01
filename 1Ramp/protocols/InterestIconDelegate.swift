//
//  InterestIconDelegate.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
protocol InterestIconDelegate {
    func onInterestTapped(selected: Bool, interestId: Int, interestTag: String) -> ()
}
