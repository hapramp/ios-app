//
//  User.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

struct User : Codable{
    let username: String
    let communities: [Interest]
    let isCompetitionUser: Bool?
    let microCommunities: [MicroCommunity]
    
    private enum CodingKeys : String, CodingKey{
        case username
        case communities
        case isCompetitionUser = "is_competition_user"
        case microCommunities = "micro_communities"
    }
}
