//
//  ViewController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController{
    
    let testView: InterestView = {
        let tv = InterestView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.black12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messagePanel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Dont't have a STEEM Account?"
        lbl.textColor = Colors.primaryColor
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let signupButton: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.addTarget(self, action: #selector(handleSignupBtnClick), for: .touchUpInside)
        let title = "   Sign Up   ".uppercased()
        btn.setTitle(title, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Colors.primaryColor.cgColor
        btn.layer.cornerRadius = 24
        btn.setTitleColor(Colors.primaryColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let logoImage : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "hapramp_logo")
        return iv
    }()
    

    let loginButton: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.addTarget(self, action: #selector(handleLoginBtnClick), for: .touchUpInside)
        let title = "    Login Using SteemConnect    ".uppercased()
        btn.setTitle(title, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = Colors.primaryColor.cgColor
        btn.layer.cornerRadius = 4
        btn.backgroundColor = Colors.primaryColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
}

