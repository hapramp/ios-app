//
//  SteemitImages.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class SteemitImages{
    public static func getResizedImageUrl(url: String) -> String{
        let screenWidth = Int(UIScreen.main.bounds.width)
        return "https://steemitimages.com/\(screenWidth)x0/\(url)"
    }
}
