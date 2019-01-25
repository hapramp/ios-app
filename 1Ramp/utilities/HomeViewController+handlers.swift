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
    
    
    public func populateInterestsFilter(){
        let filters = getAllFilters()
        horizontalInterestFilterView.interests = filters.0
        horizontalInterestFilterView.preSelections = filters.1
    }
    
    
    func addConstraintToHorizontalFilterView(){
        filterViewTopAnchorConstraint = horizontalInterestFilterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        filterViewTopAnchorConstraint?.isActive = true
        horizontalInterestFilterView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.heightAnchor.constraint(equalToConstant: Dimensions.InterestViewInHorizontalFilterView.collectionViewHeight()).isActive = true
    }
    
    public func setDelegateToFilterView(){
        horizontalInterestFilterView.delegate = self
    }
    
    func addConstraintToFeedListView(){
        feedListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        feedListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        feedListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //add delegate to listen to events (Scroll direction etc.)
        feedListView.delegate = self
    }
    
    func checkPreRequisite(){
        if let interests = LocalData.sharedInstance.getUser()?.communities{
            if interests.count>0{
                return
            }
        }
        moveToInterestSelection()
    }
    
    func getAllFilters() -> ([Interest], [Bool]){
        var preSelections = [Bool]()
        
        var defInterests = DefaultHomeInterestFilters.getDefaultFilters()
        //select explore
        preSelections.append(true)
        //un-select feed
        preSelections.append(false)
        
        let user = LocalData.sharedInstance.getUser()
        var preselectedInterests = user?.communities
        
        preselectedInterests?.sort(by: {$0.name < $1.name})
        for interest in preselectedInterests!{
            defInterests.append(interest)
            preSelections.append(false)
        }
        return (defInterests,preSelections)
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
    
    func onFilterSelected(interestTag: String) {
        print("selected : \(interestTag)")
    }
}
