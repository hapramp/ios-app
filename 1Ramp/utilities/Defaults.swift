//
//  Defaults.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
struct Defaults {
    private static let isLoggedInKey = "isLoggedIn"
    
    static var clearDefaults = {() in
            UserDefaults.standard.removeObject(forKey: isLoggedInKey)
    }

    static var setLoggedIn = {(isLoggedIn: Bool) in
            UserDefaults.standard.set(isLoggedIn, forKey: isLoggedInKey)
    }
    
    static var isLoggedIn = {(_) -> Bool in
        return UserDefaults.standard.value(forKey: isLoggedInKey) as? Bool ?? false
    }(())
    
}
