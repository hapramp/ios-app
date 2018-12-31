//
//  HomeViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    
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
    
    let logoutBtn : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
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
        view.addSubview(logoutBtn)
        view.addSubview(editInterestBtn)
        view.addSubview(panel)
        view.addSubview(interestsPanel)
        
        logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        editInterestBtn.topAnchor.constraint(equalTo: logoutBtn.bottomAnchor, constant: 8).isActive = true
        editInterestBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        panel.centerXAnchor.constraint(equalTo: logoutBtn.centerXAnchor).isActive = true
        panel.topAnchor.constraint(equalTo: editInterestBtn.bottomAnchor, constant: 8).isActive = true
        
        interestsPanel.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: 8).isActive = true
        interestsPanel.centerXAnchor.constraint(equalTo: panel.centerXAnchor).isActive = true
        interestsPanel.widthAnchor.constraint(equalToConstant: 144).isActive = true
        interestsPanel.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        updatePanel()
        checkPreRequisite()
    }
    
}
