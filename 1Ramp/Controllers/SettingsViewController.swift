//
//  SettingsViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 31/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class SettingsViewController: UIViewController{
    
    let logoutButton : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(logoutButton)
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
