//
//  MicroCommunity.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

struct MicroCommunity : Codable{
    let id: Int
    let name: String
    let tag: String
    let imageUri: String
    let description: String
    let parentCommunity: Interest
    
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case tag
        case imageUri = "image_url"
        case description
        case parentCommunity = "community"
    }
}
