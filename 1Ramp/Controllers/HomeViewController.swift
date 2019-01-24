//
//  HomeViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController, HomeFilterDelegate {

    let shimmerTest: FeedItemCell = {
        let fic = FeedItemCell()
        fic.translatesAutoresizingMaskIntoConstraints = false
        return fic
    }()
    
    let horizontalInterestFilterView: HorizontalInterestsFilterView = {
        let hif = HorizontalInterestsFilterView()
        hif.translatesAutoresizingMaskIntoConstraints =  false
        return hif
    }()
    
    let interestsPanel: UITextView = {
        let tv =  UITextView()
        tv.isEditable = false
        tv.text = "here"
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let panel : UILabel = {
        let label = UILabel()
        label.text = "init"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editInterestBtn : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Edit Interests", for: .normal)
        button.addTarget(self, action: #selector(handleEditInterests), for: .touchUpInside)
        return button
    }()
 
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        view.addSubview(horizontalInterestFilterView)
        
        //test view
        view.addSubview(shimmerTest)
        shimmerTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerTest.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        shimmerTest.widthAnchor.constraint(equalToConstant: 400).isActive = true
        shimmerTest.heightAnchor.constraint(equalToConstant: 520).isActive = true
        
        
        horizontalInterestFilterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        horizontalInterestFilterView.heightAnchor.constraint(equalToConstant: Dimensions.InterestViewInHorizontalFilterView.collectionViewHeight()).isActive = true
        populateInterestsFilter()
        setDelegateToFilterView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        horizontalInterestFilterView.addBottomShadow()
        
        //apply gradient
        shimmerTest.applyGradientMaskToMock()
    }
    
    public func setDelegateToFilterView(){
        horizontalInterestFilterView.delegate = self
    }
    
    public func populateInterestsFilter(){
        let filters = getAllFilters()
        horizontalInterestFilterView.interests = filters.0
        horizontalInterestFilterView.preSelections = filters.1
    }
}
