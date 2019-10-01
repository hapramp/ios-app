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
    var itemHeight: CGFloat?
    var itemWidth: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func addView(views: [UIView], itemHeight: CGFloat, itemWidth: CGFloat){
        self.views = views
        self.itemWidth = itemWidth
        self.itemHeight = itemHeight
        self.arrangeViews()
    }
    
    private func arrangeViews(){
        var lastView: UIView = UIView()
        let originalHorizontalPadding = Dimensions.InterestViewInSelectionController.horizontalSpacing
        let originalVerticalPadding = Dimensions.InterestViewInSelectionController.verticalSpacing
        var currentLeftPadding = originalHorizontalPadding
        var currentTopPadding = originalVerticalPadding
        var tAnchor = self.topAnchor
        var lAnchor = self.leftAnchor
        
        if let itemsCount = views?.count{
            for i in 0..<itemsCount{
                
                if let view = views?[i] {
                    let col = Int(i % Int(Dimensions.InterestViewInSelectionController.columns))
                    if col==0 {
                        lAnchor = self.leftAnchor
                        currentLeftPadding = originalHorizontalPadding
                    }else{
                        lAnchor = lastView.rightAnchor
                        currentLeftPadding = 2 * originalHorizontalPadding
                    }
                    
                    view.isUserInteractionEnabled = true
                    self.addSubview(view)
                    view.leftAnchor.constraint(equalTo: lAnchor, constant: currentLeftPadding).isActive = true
                    view.topAnchor.constraint(equalTo: tAnchor, constant: currentTopPadding).isActive = true
                    view.heightAnchor.constraint(equalToConstant: itemHeight!).isActive = true
                    view.widthAnchor.constraint(equalToConstant: itemWidth!).isActive = true
                    
                    //detect wrap
                    if (i+1) % Int(Dimensions.InterestViewInSelectionController.columns) == 0{
                        tAnchor = lastView.bottomAnchor
                        currentTopPadding = 2 * originalVerticalPadding
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
