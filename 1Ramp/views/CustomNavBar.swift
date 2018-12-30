//
//  CustomNavBar.swift
//  1Ramp
//
//  Created by Ankit Kumar on 30/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class CustomNavBar: UIView {
    
    let navBar: UIView = {
        let nBar = UIView()
        nBar.backgroundColor = UIColor.blue
        nBar.translatesAutoresizingMaskIntoConstraints = false
        return nBar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
    }
    
    override func layoutSubviews() {
        addSubview(navBar)
        navBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: Dimensions.navigationBarHeight).isActive = true
        navBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        navBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented!")
    }
}
