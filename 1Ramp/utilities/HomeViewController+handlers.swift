//
//  HomeViewController+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 30/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
extension HomeViewController{

    @objc func handleEditInterests(){
        moveToInterestSelection()
    }
    
    func updatePanel(){
        let username = LocalData.sharedInstance.getUsername()
        let user = LocalData.sharedInstance.getUser()
        var interestString: String = ""
        for interest in user!.communities {
            interestString.append(interest.name)
            interestString.append("\n")
        }
        panel.text = "Logged in as: \(username)"
        interestsPanel.text = interestString
    }
    
    func checkPreRequisite(){
        if let interests = LocalData.sharedInstance.getUser()?.communities{
            if interests.count>0{
                return
            }
        }
        moveToInterestSelection()
    }
    
    func moveToInterestSelection(){
        let interesetSelectionController = InterestSelectionViewController()
        interesetSelectionController.preSelectedInterest = getPreSelectedInterests()
        AppDelegate.sharedInstance().setRootController(viewController: interesetSelectionController)
    }
    
    func getPreSelectedInterests() -> [Int]{
        var its: [Int] = []
        let user = LocalData.sharedInstance.getUser()
        if let interests = user?.communities{
            for item in interests{
                its.append(item.id)
            }
        }
        return its
    }
}
