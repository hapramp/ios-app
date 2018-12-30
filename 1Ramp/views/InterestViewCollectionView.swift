//
//  InterestViewCollectionView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 29/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
class InterestViewCollectionView: UIView {
    var views: [UIView]?
    var dimension: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func addView(views: [UIView], dimension: CGFloat){
        self.views = views
        self.dimension = dimension
        self.arrangeViews()
    }
    
    private func arrangeViews(){
        var lastView: UIView = UIView()
        var originalPadding = Dimensions.InterestView.padding
        var currentLeftPadding = originalPadding
        var currentTopPadding = originalPadding
        var tAnchor = self.topAnchor
        var lAnchor = self.leftAnchor
        
        if let itemsCount = views?.count{
            for i in 0..<itemsCount{
                
                if let view = views?[i] {
                    let col = Int(i % Int(Dimensions.InterestView.columns))
                    if col==0 {
                        lAnchor = self.leftAnchor
                        currentLeftPadding = originalPadding
                    }else{
                        lAnchor = lastView.rightAnchor
                        currentLeftPadding = 2 * originalPadding
                    }
                    
                    view.isUserInteractionEnabled = true
                    self.addSubview(view)
                    view.leftAnchor.constraint(equalTo: lAnchor, constant: currentLeftPadding).isActive = true
                    view.topAnchor.constraint(equalTo: tAnchor, constant: currentTopPadding).isActive = true
                    view.heightAnchor.constraint(equalToConstant: dimension!).isActive = true
                    view.widthAnchor.constraint(equalToConstant: dimension!).isActive = true
                    
                    //detect wrap
                    if (i+1) % Int(Dimensions.InterestView.columns) == 0{
                        tAnchor = lastView.bottomAnchor
                        currentTopPadding = 2*originalPadding
                    }
                    lastView = view
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
