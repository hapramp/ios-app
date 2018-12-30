//
//  InterestView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class InterestView: UIView{
    
    var interestTag: String?
    var delegate: InterestIconDelegate?
    
    var selected: Bool = false{
        didSet{
            setSelected(selected: selected)
        }
    }
    
    var interestId: Int = 0
    
    var interestName: String = ""{
        didSet{
            interestTitle.text = interestName
        }
    }
    
    var interestColor: UIColor = UIColor.black{
        didSet{
            setSelected(selected: selected)
        }
    }
    
    var interestIconName: String = AssetsUtil.Art{
        didSet{
            self.setImageIcon(name: interestIconName)
        }
    }
    
    let interestIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let interestBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.design
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let interestTitle: UILabel = {
        let label = UILabel()
        label.text = "Design"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setImageIcon(name: String) {
        interestIcon.image = UIImage(named: name)
    }
    
    func setupViews(){
        addSubview(interestBackground)
        addSubview(interestIcon)
        addSubview(interestTitle)
        
        interestBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        interestBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        interestBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        interestBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24).isActive = true
        interestTitle.topAnchor.constraint(equalTo: interestBackground.bottomAnchor, constant: 0).isActive = true
        interestTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        interestTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        interestIcon.centerXAnchor.constraint(equalTo: interestBackground.centerXAnchor).isActive = true
        interestIcon.centerYAnchor.constraint(equalTo: interestBackground.centerYAnchor).isActive = true
        
        interestIcon.heightAnchor.constraint(equalToConstant: Dimensions.InterestView.iconDimension).isActive = true
        interestIcon.widthAnchor.constraint(equalToConstant: Dimensions.InterestView.iconDimension).isActive = true
        
        interestBackground.layer.cornerRadius = (Dimensions.InterestView.dimension - 32) / 2
        interestBackground.layer.masksToBounds = true
        interestBackground.layer.borderWidth = 1
        //layer.borderColor = UIColor.black.cgColor
        setSelected(selected: selected)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInterestIconTapped)))
    }
    
    @objc func handleInterestIconTapped(){
        selected = !selected
        if delegate != nil{
            delegate?.onInterestTapped(selected: selected, interestId: interestId)
        }
    }
    
    private func setSelected(selected: Bool){
        if selected{
            //remove border
            interestBackground.layer.borderColor = UIColor.clear.cgColor
            //set background color
            interestBackground.layer.backgroundColor = interestColor.cgColor
        }else{
            //add border
            interestBackground.layer.borderColor = UIColor.black.cgColor
            //remove background
            interestBackground.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
