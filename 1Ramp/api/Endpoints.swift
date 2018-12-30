//
//  Endpoints.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Foundation
struct Endpoints{
    static let BASE_URL = "https://api.hapramp.com/api/v2"
    // communities
    struct Communitites {
        static let communities: String = "\(BASE_URL)/communities"
    }
    
    //auth
    struct Auth {
        static let login: String = "\(BASE_URL)/login"
    }
    
    //user
    struct Users {
        static let updateUserInterest: String = "\(BASE_URL)/users/communities"
        
        static let userByUsername = {(username: String) -> String in
            return "\(BASE_URL)/users/usernames/\(username)"
        }
    }
}
