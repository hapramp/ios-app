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
    var selected: Bool = false
    
    var dimensionConfig: DimensionConfig?{
        didSet{
            interestTitle.font = UIFont.systemFont(ofSize: (dimensionConfig?.textSize)!)
        }
    }
    
    var info: Info?{
        didSet{
            setSelected(selected: (info?.selected)!)
            interestTitle.text = info?.interestName
            self.setImageIcon(name: (info?.interestIconName)!)
        }
    }
   
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
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
    }
    
    func setConfig(config: DimensionConfig){
        self.dimensionConfig = config
        setupViews()
    }
    
    func setImageIcon(name: String) {
        interestIcon.image = UIImage(named: name)
    }
    
    func setupViews(){
        addSubview(containerView)
        if let dimension = dimensionConfig{
            //Container view
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            containerView.heightAnchor.constraint(equalToConstant: dimension.height).isActive = true
            containerView.widthAnchor.constraint(equalToConstant: dimension.width).isActive = true
            
            //Background Colored region
            containerView.addSubview(interestBackground)
            let circularRegionDimension = dimension.width - 2 * dimension.circularViewPadding
            
            interestBackground.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: dimension.circularViewPadding).isActive = true
            interestBackground.topAnchor.constraint(equalTo: containerView.topAnchor, constant: dimension.circularViewPadding).isActive = true
            
            interestBackground.heightAnchor.constraint(equalToConstant: circularRegionDimension).isActive = true
            interestBackground.widthAnchor.constraint(equalToConstant: circularRegionDimension).isActive = true
            
            //Interest Icon
            interestBackground.addSubview(interestIcon)
            interestIcon.centerXAnchor.constraint(equalTo: interestBackground.centerXAnchor).isActive = true
            interestIcon.centerYAnchor.constraint(equalTo: interestBackground.centerYAnchor).isActive = true
            interestIcon.heightAnchor.constraint(equalToConstant: dimension.imageIconDimension).isActive = true
            interestIcon.widthAnchor.constraint(equalToConstant: dimension.imageIconDimension).isActive = true
            
            //Interest title
            containerView.addSubview(interestTitle)
            
            interestTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            interestTitle.topAnchor.constraint(equalTo: interestBackground.bottomAnchor, constant: dimension.circularViewPadding).isActive = true
            
            interestBackground.layer.cornerRadius = circularRegionDimension/2
            interestBackground.layer.masksToBounds = true
            interestBackground.layer.borderWidth = 1
            self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInterestIconTapped)))
        }
    }
    
    @objc func handleInterestIconTapped(){
        self.setSelected(selected: !selected)
        if delegate != nil{
            delegate?.onInterestTapped(selected: selected, interestId: (info?.interestId)!)
        }
    }
    
    private func setSelected(selected: Bool){
        self.selected = selected
        if selected{
            //remove border
            interestBackground.layer.borderColor = UIColor.clear.cgColor
            //set background color
            interestBackground.layer.backgroundColor = info?.interestColor.cgColor
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
    
    public struct DimensionConfig {
        var width: CGFloat
        var height: CGFloat
        var circularViewPadding: CGFloat
        var imageIconDimension: CGFloat
        var textSize: CGFloat
        var textHeight: CGFloat
    }
    
    struct Info {
        var interestColor: UIColor
        var interestIconName: String
        var interestTag: String
        var interestName: String
        var interestId: Int
        var selected: Bool
    }
}
