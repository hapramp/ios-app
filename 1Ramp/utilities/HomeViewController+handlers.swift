//
//  HomeViewController+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 30/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
extension HomeViewController: FeedListDelegate{
    
    /*
     delegate method of FeedListView, gets called when scroll happens to FeedListView
     ...
     ...
     If scroll direction = up
     Scroll up and hide the filter view
     Else scroll direction = down
     Scroll down to its original position
     */
    func onFeedListScrolled(inUpDirection: Bool) {
        if inUpDirection{
            //hide filter view
            if !isFilterViewHidden{
                hideFilterView()
            }
        }else{
            //show filter view
            if isFilterViewHidden{
                showFilterView()
            }
        }
    }
    
    /*
     Gathers data for Filter View
     Specifically, it gets all the items and selections and set both data to InterestFilterView
     */
    public func populateInterestsFilter(){
        let filters = getAllFilters()
        horizontalInterestFilterView.interests = filters.0
        horizontalInterestFilterView.preSelections = filters.1
    }
    
    /*
     Add constraint to HorizontalFilterView
     */
    func addConstraintToHorizontalFilterView(){
        filterViewTopAnchorConstraint = horizontalInterestFilterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        filterViewTopAnchorConstraint?.isActive = true
        horizontalInterestFilterView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.heightAnchor.constraint(equalToConstant: Dimensions.InterestViewInHorizontalFilterView.collectionViewHeight()).isActive = true
    }
    
    /*
     Set itself as delegate to FilterView, conforming this delegate protocol we can receive new selections/changes in Filter view. We require this data to fetch/update collection view feed type.
     */
    public func setDelegateToFilterView(){
        horizontalInterestFilterView.delegate = self
    }
    
    /*
     Add constraint to FeedListView
     */
    func addConstraintToFeedListView(){
        feedListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        feedListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        feedListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //add delegate to listen to events (Scroll direction etc.)
        feedListView.delegate = self
    }
    
    /*
     Helper method which checks user selected communities. If user has not selected any, we direct them to Interest selection page.
     */
    func checkInterestSelectionAndMoveToSelectionPageIfNeeded(){
        if let interests = LocalData.sharedInstance.getUser()?.communities{
            if interests.count>0 {
                return
            }
        }
        moveToInterestSelection()
    }
    
    /*
     Prepare all filter items.
     Pre-pend the default filters (Explore, Feed)
     and then append user selected interests
     
     Prepares a bool array with first item as true and rest as false.
     This serves as default selections.
     
     e.g. [true, false, false]
     means first item is selected and rest are not.
     */
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
    
    /*
     Helper method which takes user to InterestSelectionController
     */
    func moveToInterestSelection(){
        let interesetSelectionController = InterestSelectionViewController()
        interesetSelectionController.preSelectedInterest = getPreSelectedInterests()
        AppDelegate.sharedInstance().setRootController(viewController: interesetSelectionController)
    }
    
    /*
     Returns all the user selected interests
     */
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
    
    /*
     Delegate method which gets called when user changes filter selections.
     We need to fetch and update the collection view according to parameter: interestTag
     */
    func onFilterSelected(interestTag: String) {
        print("selected : \(interestTag)")
    }
    
    public func fetchExploreFeeds(){
        ApiRequests.sharedInstance.fetchExploreFeeds(limit: ApiRequests.DefaultExploreFeedLimit , start_author: "", start_permlink: "") { (feeds, err) in
            if feeds != nil{
                if let list = feeds{
                    print("loaded first: \(list.count)")
                    self.feedListView.setFeeds(feeds: list)
                }
            }else{
                //present error to feedlist view
                print("error: \(err)")
            }
        }
    }
    
    func onLoadMoreFeedsWith(limit: Int, start_author: String, start_permlink: String) {
        ApiRequests.sharedInstance.fetchExploreFeeds(limit: limit, start_author: start_author, start_permlink: start_permlink) { (feeds, err) in
            if feeds != nil{
                if let list = feeds{
                    //print("loaded more: \(list.count)")
                    self.feedListView.appendFeeds(newFeeds: list)
                }
            }else{
                //present error to feedlist view
                print("error: \(err)")
            }
        }
    }
}
