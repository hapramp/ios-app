//
//  HomeViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController, HomeFilterDelegate, FeedListDelegate {
    /*
     Variable to store the state of filter view
     */
    var isFilterViewHidden: Bool = false
    
    /*
     delegate method of FeedListView, gets called when scroll happens to FeedListView
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
     Helper method to hide filter view with animation.
     */
    fileprivate func hideFilterView(){
        filterViewTopAnchorConstraint?.constant = -Dimensions.InterestViewInHorizontalFilterView.collectionViewHeight()
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        isFilterViewHidden = true
    }
    
    /*
     Helper method to show filter view with animation.
     */
    fileprivate func showFilterView(){
        filterViewTopAnchorConstraint?.constant = 0
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        isFilterViewHidden = false
    }
    
    /*
     Views
     */
    let feedListView: FeedListView = {
        let fic = FeedListView()
        fic.collectionView.contentInset = UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
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
    
    
    /*
     variable to store top anchor constraint of filter view, we need the top anchor reference to animate the contraints while hiding/showing the view
     */
    var filterViewTopAnchorConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(feedListView)
        view.addSubview(horizontalInterestFilterView)
        
        addConstraintToFeedListView()
        addConstraintToHorizontalFilterView()
        
        populateInterestsFilter()
        setDelegateToFilterView()
    }
    
    /*
     Call some method which requires view to be inflated before it is called.
     */
    override func viewDidAppear(_ animated: Bool) {
        horizontalInterestFilterView.addBottomShadow()
    }
}
