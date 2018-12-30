//
//  SCConnect.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
class SCConnect {
    public static var sharedInstance: SCConnect?
    
    public var operations: Operations!
    public var scconfig: SCConfig!
    public var auth: Auth!
    public var accessToken: String?
   
    public func initialize(config: NSDictionary){
        operations = Operations()
        auth = Auth()
        scconfig = SCConfig(config: config)
    }
    
    func set(access_token: String){
        self.accessToken = access_token
    }
    
    fileprivate func getLoginUrl() -> String {
        return auth.getLoginUrl(config: scconfig)
    }
    
    func getTokenRevokeUrl() -> String{
        return auth.getTokenRevokeUrl(config: scconfig)
    }
    
    func authorize(completion: @escaping (_ username: String,_ accessToken: String) -> Void){
        let url = URL(string: getLoginUrl())
        authorizationCallback = completion
        UIApplication.shared.open(url!, options : [:], completionHandler : nil)
    }
    
    var authorizationCallback: ((_ username: String,_ accessToken: String) -> Void)?
    
    func handleRedirect(url: URL){
        guard let queryParams = url.queryParameters,
              let accessToken = queryParams[Constants.ACCESS_TOKEN_PARAM],
              let username = queryParams[Constants.USERNAME_PARAM]
            else{
            authorizationCallback!("","")
            return
        }
        authorizationCallback!(username, accessToken)
    }
    
}
