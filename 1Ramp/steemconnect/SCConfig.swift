//
//  SCConfig.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Foundation
class SCConfig{
    var configuration: NSDictionary!
    //configs
    var base_url = "https://steemconnect.com"
    var client_id: String = ""
    var client_secret: String = ""
    var redirect_uri: String = ""
    var scope: String = ""
    
    init() {
    }
    
    init(config: NSDictionary) {
        self.configuration = config
        client_id = (config[ConfigKeys.CLIENT_ID] as! String)
        client_secret = (config[ConfigKeys.CLIENT_SECRET] as! String)
        redirect_uri = (config[ConfigKeys.REDIRECT_URI] as! String)
        scope = (config[ConfigKeys.SCOPES] as! String)
    }
}
