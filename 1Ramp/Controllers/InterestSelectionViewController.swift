//
//  InterestSelectionViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class InterestSelectionViewController: UIViewController, InterestIconDelegate {
    
    var preSelectedInterest: [Int]?{
        didSet{
            self.invalidateSelections()
        }
    }
    
    var selectedInterests = [Int]()
    
    let navBar: UIView = {
        let nBar = UIView()
        nBar.backgroundColor = UIColor.white
        nBar.translatesAutoresizingMaskIntoConstraints = false
        return nBar
    }()
    
    let navTitle: UILabel = {
        let label = UILabel()
        label.text = "Select Your Interests"
        label.textColor = Colors.black87
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let closeButton: UIButton = {
        let cb = UIButton(type: UIButton.ButtonType.system)
        cb.setImage(UIImage(named: AssetsUtil.CloseIcon), for: .normal)
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.tintColor = UIColor.black
        return cb
    }()
    
    
    let containerView: InterestViewCollectionView = {
        let cv = InterestViewCollectionView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let continueButton: UIButton = {
        let cb = UIButton(type: UIButton.ButtonType.system)
        cb.setTitle("Continue".uppercased(), for: .normal)
        cb.setTitleColor(UIColor.white, for: .normal)
        cb.backgroundColor = Colors.primaryColor
        cb.layer.cornerRadius = 24
        cb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cb.layer.masksToBounds = true
        cb.addTarget(self, action: #selector(handleContineButtonTap), for: .touchUpInside)
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupInterestGrid()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addShadow()
    }
}
