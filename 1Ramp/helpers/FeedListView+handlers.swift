//
//  FeedListView+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

extension FeedListView: UICollectionViewDataSourcePrefetching{
    
    func getCellHeight(index: IndexPath) -> CGFloat{
        if let feedList = feeds{
            if index.row < feedList.count{
                let feed = feedList[index.row]
                let height = FeedCollectionViewCellHelper.calculateViewHeightFor(feed: feed)
                return height
            }
        }
        return Dimensions.FeedListView.defaultHeight
    }
    
    
    func refresh(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoading(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func dispatchScrollEventToDelegate(inUpDirection: Bool){
        if let delegate = delegate{
            delegate.onFeedListScrolled(inUpDirection: inUpDirection)
        }
    }
    
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
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellId)
    }
}
