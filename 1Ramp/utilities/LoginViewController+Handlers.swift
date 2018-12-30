//
//  LoginViewController+Handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 27/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
extension LoginViewController{
    
    @objc func handleSignupBtnClick(){
        print("signup clicked!")
    }
    
    @objc func handleLoginBtnClick(){
        AppDelegate.steemConnect.authorize { (username, accessToken) in
            if accessToken.count == 0 {
                LocalData.sharedInstance.clearData()
                //show error HUD with auto-dismissal of 2 secs
            }else{
                //successfully logged In
                LocalData.sharedInstance.setLoggedIn(status: true)
                LocalData.sharedInstance.setAccessToken(accessToken: accessToken)
                LocalData.sharedInstance.setUsername(username: username)
                self.obtainUserToken()
            }
        }
    }
    
    func obtainUserToken(){
        showHUD(withStatus: "Authenticating...")
        ApiRequests.sharedInstance.requestUserToken { (userToken, error) in
            if error != nil{
                //dismiss HUD and show error login
                DispatchQueue.main.async {
                    self.dismissHUD()
                }
                print("error while obtaining token : \(error!)")
            }else{
                LocalData.sharedInstance.setUserToken(userToken: userToken!)
                self.fetchAllCommunitites()
            }
        }
    }
    
    func fetchAllCommunitites(){
        ApiRequests.sharedInstance.fetchAllInterests { (interests) in
            if interests == nil{
                print("error response for interests")
                self.dismissHUD()
                return
            }
            LocalData.sharedInstance.saveAllInterestsList(interests: interests!)
            self.fetchUserData()
        }
    }
    
    func fetchUserData(){
        let username = LocalData.sharedInstance.getUsername()
        ApiRequests.sharedInstance.requestUserData(username: username) { (user) in
            DispatchQueue.main.async {
                self.dismissHUD()
            }
            if user != nil {
                if (user?.communities.count)! > 0{
                    LocalData.sharedInstance.saveUserJson(user: user!)
                    self.moveToHomePage()
                }else{
                    self.moveToInterestSelectionPage()
                }
                
            }else{
                print("error occured while fetching user info")
            }
        }
    }
    
    func moveToHomePage(){
        let homeController = HomeViewController()
        present(homeController, animated: true, completion: nil)
    }
    
    func moveToInterestSelectionPage(){
        let interestSelectionController = InterestSelectionViewController()
        present(interestSelectionController, animated: true, completion: nil)
    }
    
    func errorWhileObtainingToken(){
        print("some error occured!")
        //show failed login message
    }
    
    
    func setupViews(){
        view.addSubview(logoImage)
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        view.addSubview(messagePanel)
        view.addSubview(divider)
        
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 256).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 108).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 108).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -48).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        divider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        divider.leftAnchor.constraint(equalTo: loginButton.leftAnchor, constant: -24).isActive = true
        divider.rightAnchor.constraint(equalTo: loginButton.rightAnchor, constant: 24).isActive = true
        divider.bottomAnchor.constraint(equalTo: messagePanel.topAnchor, constant: -16).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        messagePanel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messagePanel.bottomAnchor.constraint(equalTo: signupButton.topAnchor, constant:-16).isActive = true
        
        signupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: 172).isActive = true
        
    }
}
