//
//  InterestSelectionViewController+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 30/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire

extension InterestSelectionViewController{
    
    @objc func handleContineButtonTap(){
        showHUD(withStatus: "Saving your Interests...")
        updateServer()
    }
    
    func updateServer(){
        ApiRequests.sharedInstance.updateUserInterests(interest: selectedInterests) { (user) in
            DispatchQueue.main.async {
                self.dismissHUD()
            }
            if user == nil{
                print("failed to update user interests!")
                return
            }
            LocalData.sharedInstance.saveUserJson(user: user!)
            self.moveToHome()
        }
    }
    
    func moveToHome(){
        let homeController = HomeViewController()
        present(homeController, animated: true, completion: nil)
    }
    
    func setupNavigationBar(){
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        view.addSubview(navBar)
        view.addSubview(continueButton)
        
        navBar.addSubview(navTitle)
        navBar.addSubview(closeButton)
        
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight).isActive = true
        navBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: Dimensions.navigationBarHeight).isActive = true
        
        closeButton.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 16).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: navBar.centerYAnchor).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        navTitle.centerYAnchor.constraint(equalTo: navBar.centerYAnchor).isActive = true
        navTitle.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 144).isActive = true
    }
    
    
    func setupInterestGrid(){
        view.addSubview(containerView)
        let views: [UIView] = getListOfViews()
        let cvHeight = Dimensions.InterestViewInSelectionController.interestContainerHeightFor(items: views.count)
        let cvWidth = Dimensions.InterestViewInSelectionController.interestContainerViewWidth
        
        containerView.addView(views: views, itemHeight: Dimensions.InterestViewInSelectionController.height, itemWidth: Dimensions.InterestViewInSelectionController.width)
        
        containerView.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 24).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: cvHeight).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: cvWidth).isActive = true
    }
    
    func addShadow(){
        let shadowRect = CGRect(x: 0, y: navBar.bounds.height, width: navBar.bounds.width, height: 2)
        let shadowPath = UIBezierPath(rect: shadowRect)
        navBar.layer.shadowPath = shadowPath.cgPath
        navBar.layer.shadowRadius = 2.0
        navBar.layer.shadowColor = UIColor.black.cgColor
        navBar.layer.shadowOpacity = 0.7
    }
    
    func getListOfViews() -> [UIView]{
        var views = [UIView]()
        if let interests = LocalData.sharedInstance.getAllInterestsList(){
            for interest in interests{
                let testView = InterestView()
                testView.translatesAutoresizingMaskIntoConstraints = false
                
                let info = InterestView.Info.init(
                    interestColor: AssetsUtil.interstColorFor(tag: interest.tag),
                    interestIconName: AssetsUtil.interstImageNameFor(tag: interest.tag),
                    interestTag: interest.tag,
                    interestName: interest.name,
                    interestId: interest.id,
                    selected: isInterestPreSelected(interestId: interest.id
                ))
                
                let config = InterestView.DimensionConfig.init(
                    width: Dimensions.InterestViewInSelectionController.width,
                    height: Dimensions.InterestViewInSelectionController.height,
                    circularViewPadding: Dimensions.InterestViewInSelectionController.circularViewPadding,
                    imageIconDimension: Dimensions.InterestViewInSelectionController.imageIconDimension,
                    textSize: Dimensions.InterestViewInSelectionController.textSize,
                    textHeight: Dimensions.InterestViewInSelectionController.textHeight)
                
                testView.setConfig(config: config)
                testView.info = info
                testView.delegate = self
                views.append(testView)
            }
        }
        return views
    }
    
    func isInterestPreSelected(interestId: Int) -> Bool{
        if let preSelections = preSelectedInterest{
            return preSelections.contains(interestId)
        }
        return false
    }
    
    func invalidateSelections(){
        selectedInterests.append(contentsOf: preSelectedInterest!)
    }
    
    func onInterestTapped(selected: Bool, interestId: Int) {
        if selected{
            if !selectedInterests.contains(interestId){
                selectedInterests.append(interestId)
            }
        }else{
            if selectedInterests.contains(interestId){
                if let interestIndex = selectedInterests.firstIndex(of: interestId){
                    selectedInterests.remove(at: interestIndex)
                }
            }
        }
        print("Now selected interests \(selectedInterests)")
    }
}
