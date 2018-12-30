//
//  Auth.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Foundation
class Auth{
    func getLoginUrl(config: SCConfig) -> String{
        let loginUrl = "\(config.base_url)/oauth2/authorize?client_id=\(config.client_id)&redirect_uri=\(config.redirect_uri)&response_type=access_token&scope=\(config.scope)"
        return loginUrl
    }
    
    func getTokenRevokeUrl(config: SCConfig) -> String{
        let revokeUrl = "\(config.base_url)/oauth2/token/revoke"
        return revokeUrl
    }
}
