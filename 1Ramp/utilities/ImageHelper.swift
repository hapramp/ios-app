//
//  ImageHelper.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class ImageHelper{
    public static func getResizedImageUrl(url: String) -> String{
        let screenWidth = Int(UIScreen.main.bounds.width)
        return "https://steemitimages.com/\(screenWidth)x0/\(url)"
    }
    
    public static func getEstimatedImageHeight() -> Int{
        let deviceWidth = Int(UIScreen.main.bounds.width)
        return (deviceWidth * 3)/4
    }
}
