//
//  DefaultHomeInterestFilters.swift
//  1Ramp
//
//  Created by Ankit Kumar on 24/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
struct DefaultHomeInterestFilters{
    public static func getDefaultFilters() -> [Interest]{
        var defIntersts = [Interest]()
        let explore = Interest.init(id: AssetsUtil.ExploreId, name: "Explore", color:"" , tag: "hapramp-explore", imageUri: "explore")
        let feed = Interest.init(id: AssetsUtil.FeedId, name: "Feed", color: "", tag: "hapramp-feed", imageUri: "image")
        defIntersts.append(explore)
        defIntersts.append(feed)
        return defIntersts
    }
}
