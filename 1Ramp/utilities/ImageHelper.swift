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
    
    //transparent image
    static let defaultFeedImagePlaceholder = "https://user-images.githubusercontent.com/10809719/51898010-0081f080-23d6-11e9-9650-a97c01db3367.png"
}
