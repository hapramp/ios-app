//
//  MainController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 31/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class MainController: UIViewController{
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var settingsViewController: UIViewController?
    var contestViewController: UIViewController?
    
    let contestButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Contest", for: .normal)
        button.addTarget(self, action: #selector(handleContestClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let settingstButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(handleSettingsClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
        contestViewController = ContestViewController()
        settingsViewController = SettingsViewController()
    }
    
    @objc func handleContestClick(){
        print("contest clicked!")
        addChild(contestViewController!)
        contestViewController!.view.frame = containerView.frame
        containerView.addSubview(contestViewController!.view)
        contestViewController?.didMove(toParent: self)
    }
    
    @objc func handleSettingsClick(){
        print("settings clicked")
        addChild(settingsViewController!)
        contestViewController!.view.frame = containerView.frame
        containerView.addSubview(contestViewController!.view)
        contestViewController?.didMove(toParent: self)
    }
    
    fileprivate func setupViews(){
        view.addSubview(containerView)
        view.addSubview(contestButton)
        view.addSubview(settingstButton)
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        contestButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        contestButton.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight+44).isActive = true
        contestButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        settingstButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        settingstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight+44).isActive = true
        settingstButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}
