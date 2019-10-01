//
//  HorizontalInterestsFilterView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 24/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class HorizontalInterestsFilterView : BaseCustomUIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, InterestIconDelegate{
    
    func onInterestTapped(selected: Bool, interestId: Int, interestTag: String) {
        invalidateSelections(currentSelectedInterestId: interestId, interestTag: interestTag)
    }
    
    var currentSelectedIndex: Int = 0
    var preSelections: [Bool]?
    var interests: [Interest]?
    
    let interestViewCellId = "iCellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: interestViewCellId, for: indexPath) as? HorizontalInterestFilterCollectionViewCell
        cell?.setDelegate(interestSelectDelegate: self)
        cell?.setInterest(interest: interests![indexPath.row], preSelected: preSelections?[indexPath.row] ?? false)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Dimensions.InterestViewInHorizontalFilterView.itemCellWidth(), height: Dimensions.InterestViewInHorizontalFilterView.itemCellHeight())
    }
    
    let collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.contentInset = UIEdgeInsets(top: Dimensions.InterestViewInHorizontalFilterView.topInset,
                                       left: Dimensions.InterestViewInHorizontalFilterView.leftInset,
                                       bottom: Dimensions.InterestViewInHorizontalFilterView.bottomInset,
                                       right: Dimensions.InterestViewInHorizontalFilterView.rightInset)
        cv.backgroundColor = UIColor.white
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        //setup collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalInterestFilterCollectionViewCell.self, forCellWithReuseIdentifier: interestViewCellId)
    }
    
    fileprivate func invalidateSelections(currentSelectedInterestId: Int, interestTag: String){
        // get the index of next selection
        //get the index of current selection
        let newSelectionIndex = findIndexOf(id: currentSelectedInterestId)
        if newSelectionIndex != -1{
            //remove old selection
            preSelections![currentSelectedIndex] = false
            //select new one
            preSelections![newSelectionIndex] = true
            let updateIndexPath1 = IndexPath.init(item: currentSelectedIndex, section: 0)
            let updateIndexPath2 = IndexPath.init(item: newSelectionIndex, section: 0)
            collectionView.reloadItems(at: [updateIndexPath2,updateIndexPath1])
            //update local variable
            currentSelectedIndex = newSelectionIndex
        }
        
        //preform callback to delegate (if any)
        if delegate != nil{
            delegate?.onFilterSelected(interestTag: interestTag)
        }
    }
    
    fileprivate func findIndexOf(id: Int) -> Int{
        var index: Int = 0
        if let interests = interests{
            for interest in interests{
                if interest.id == id{
                    return index
                }
                index = index + 1
            }
        }
        return -1
    }
    
    var delegate: HomeFilterDelegate?
}
