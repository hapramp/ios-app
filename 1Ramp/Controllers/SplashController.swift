//
//  SplashController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
var statusBarIsHidden = true
class SplashController: UIViewController {
    
    let logo: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "hapramp_splash_icon")
        return logoImage
    }()
    
    override func viewDidLoad  () {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut), userInfo: nil, repeats: false)
        
        view.backgroundColor = Colors.primaryColor
        //add logo to center
        view.addSubview(logo)
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 108).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 108).isActive = true
    }
    
    @objc func splashTimeOut(){
        let nextViewController: UIViewController?
        let lastLoggedIn = LocalData.sharedInstance.getLoggedIn()
        if lastLoggedIn {
            nextViewController = HomeViewController()
        }else{
            nextViewController = LoginViewController()
        }
        AppDelegate.sharedInstance().window?.rootViewController = nextViewController
    }
    
    override var prefersStatusBarHidden: Bool{
        return statusBarIsHidden;
    }
}
