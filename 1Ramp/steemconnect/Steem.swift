//
//  Steem.swift
//  SwiftySteem
//
//  Created by Benedikt Veith on 20.02.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import Foundation

public class Steem {
    public static let sharedInstance = Steem()
    
    public var api : Api!
    public var broadcast : Broadcast!
    public var auth : Auth!
    public var helper : Helper!
    
    public init() {}
    
    public func initialize(config: NSDictionary) {
        api = Api(config: config)
        auth = Auth()
        helper = Helper()
        broadcast = Broadcast()
    }
}
