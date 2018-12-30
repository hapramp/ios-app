//
//  Interest.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
struct Interest : Codable {
    let id: Int
    let name: String
    let color: String
    let tag: String
    let imageUri: String
    
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case color
        case tag
        case imageUri = "image_uri"
    }
}
