//
//  FeedListView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedListView : BaseCustomUIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    var feeds: [FeedModel]?
    
    let feedCellId = "iFeedCell"
    
    func feedCount() -> Int{
        return feeds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //we need to show shimmer
        return feedCount() == 0 ? 1 : feedCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellId, for: indexPath) as! FeedCollectionViewCell
        if feedCount() == 0{
            cell.feed = nil
        }else{
            cell.feed = feeds![indexPath.row]
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 480)
    }
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //register cell
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellId)
    }
    
    var _lastContentOffset : CGPoint?
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _lastContentOffset = scrollView.contentOffset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _lastContentOffset = _lastContentOffset{
            if (_lastContentOffset.y < scrollView.contentOffset.y){
                dispatchScrollEventToDelegate(inUpDirection: true)
            }else{
                dispatchScrollEventToDelegate(inUpDirection: false)
            }
        }
    }
    
    fileprivate func dispatchScrollEventToDelegate(inUpDirection: Bool){
        if let delegate = delegate{
            delegate.onFeedListScrolled(inUpDirection: inUpDirection)
        }
    }
    
    var delegate: FeedListDelegate?
    
}
