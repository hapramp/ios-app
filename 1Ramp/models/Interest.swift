//
//  Interest.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
struct Interest : Codable {
    var id: Int
    var name: String
    var color: String
    var tag: String
    var imageUri: String
    
    init(id: Int,name: String, color: String, tag: String, imageUri: String) {
        self.id = id
        self.name = name
        self.color = color
        self.tag = tag
        self.imageUri = imageUri
    }
    
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case color
        case tag
        case imageUri = "image_uri"
    }
}
