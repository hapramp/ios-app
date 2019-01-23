//
//  SettingsViewController+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 23/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
extension SettingsViewController{
    
    @objc func handleLogout(){
        AppDelegate.sharedInstance().logout()
    }
    
}
