//
//  ImageAssestsName.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class AssetsUtil {
    static let Art: String = "art"
    static let ArtFilled: String = "art_filled"
    static let Dance: String = "dance"
    static let DanceFilled: String = "dance_filled"
    static let Travel: String = "travel"
    static let TravelFilled: String = "travel_filled"
    static let Literature: String = "literature"
    static let LiteratureFilled: String = "literature_filled"
    static let Film: String = "film"
    static let FilmFilled: String = "film_filled"
    static let Photography:String = "photography"
    static let PhotographyFilled:String = "photography_filled"
    static let Fashion: String = "fashion"
    static let FashionFilled: String = "fashion_filled"
    static let Design: String = "design"
    static let DesignFilled: String = "design_filled"
    static let CloseIcon: String = "close_icon"
    
    static func interstImageNameFor(tag: String)->String{
        switch tag{
        case "hapramp-art":
            return ArtFilled
        case "hapramp-dance":
            return DanceFilled
        case "hapramp-travel":
            return TravelFilled
        case "hapramp-literature":
            return LiteratureFilled
        case "hapramp-film":
            return FilmFilled
        case "hapramp-photography":
            return PhotographyFilled
        case "hapramp-fashion":
            return FashionFilled
        case "hapramp-design":
            return DesignFilled
        default:
            return ""
        }
    }
    
    static func interstColorFor(tag: String)-> UIColor{
        switch tag{
        case "hapramp-art":
            return Colors.art
        case "hapramp-dance":
            return Colors.dance
        case "hapramp-travel":
            return Colors.travel
        case "hapramp-literature":
            return Colors.literature
        case "hapramp-film":
            return Colors.film
        case "hapramp-photography":
            return Colors.photography
        case "hapramp-fashion":
            return Colors.fashion
        case "hapramp-design":
            return Colors.design
        default:
            return UIColor.lightGray
        }
    }
    
    
}
