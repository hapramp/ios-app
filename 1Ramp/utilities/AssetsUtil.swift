//
//  ImageAssestsName.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class AssetsUtil {
    static let WhitePlus = "add"
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
    
    //Main Tab Items
    static let Home: String = "home_icon"
    static let HomeSelected: String = "home_icon_selected"
    static let Contest: String = "competition"
    static let ContestSelected: String = "competition_filled"
    static let Profile: String = "user_icon"
    static let ProfileSelected: String = "user_icon_selected"
    static let Settings: String = "settings_icon"
    static let SettingsSelected: String = "settings_icon_selected"
    
    
    //Action bar items
    static let SearchIcon: String = "search"
    static let NotificationIcon: String = "notify"
    static let HaprampLogoIcon: String = "hapramp_logo"
    
    //Home Filters Item
    static let ExploreIcon: String = "explore"
    static let FeedIcon: String = "feed"
    static let ExploreId: Int = 101
    static let FeedId: Int = 0
    
    static func interstImageNameFor(tag: String)->String{
        switch tag{
        case "hapramp-explore":
            return ExploreIcon
        case "hapramp-feed":
            return FeedIcon
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
        case "hapramp-explore":
            return Colors.primaryColor
        case "hapramp-feed":
            return Colors.primaryColor
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
