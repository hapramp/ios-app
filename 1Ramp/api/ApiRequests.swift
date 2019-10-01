//
//  ApiRequests.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
class ApiRequests{
    static let sharedInstance = ApiRequests()
    func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            ]
        
        let authToken = LocalData.sharedInstance.getUserToken()
        headers["Authorization"] = "Token" + " " + authToken
        return headers
    }
}
