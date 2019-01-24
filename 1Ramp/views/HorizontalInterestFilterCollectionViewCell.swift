//
//  HorizontalInterestFilterCollectionViewCell.swift
//  1Ramp
//
//  Created by Ankit Kumar on 24/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class HorizontalInterestFilterCollectionViewCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let interestView: InterestView = {
        let iv = InterestView()
        iv.deSelectableOnTap(deSelectable: false)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(interestView)
        interestView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        interestView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        interestView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        interestView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        setupInterestView()
    }
    
    public func setInterest(interest: Interest, preSelected: Bool){
        let info = InterestView.Info.init(
            interestColor: AssetsUtil.interstColorFor(tag: interest.tag),
            interestIconName: AssetsUtil.interstImageNameFor(tag: interest.tag),
            interestTag: interest.tag,
            interestName: interest.name,
            interestId: interest.id,
            selected: preSelected)
        interestView.info = info
    }
    
    public func setSelected(selected: Bool){
        interestView.setSelected(selected: selected)
    }
    
    fileprivate func setupInterestView(){
        let config = InterestView.DimensionConfig.init(
            width: Dimensions.InterestViewInHorizontalFilterView.width,
            height: Dimensions.InterestViewInHorizontalFilterView.height,
            circularViewPadding: Dimensions.InterestViewInHorizontalFilterView.circularViewPadding,
            imageIconDimension: Dimensions.InterestViewInHorizontalFilterView.imageIconDimension,
            textSize: Dimensions.InterestViewInHorizontalFilterView.textSize,
            textHeight: Dimensions.InterestViewInHorizontalFilterView.textHeight)
        interestView.setConfig(config: config)
    }
    
    public func setDelegate(interestSelectDelegate: InterestIconDelegate){
        self.interestView.delegate = interestSelectDelegate
    }
}
