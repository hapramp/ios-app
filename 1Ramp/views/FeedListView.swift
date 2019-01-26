//
//  FeedListView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedListView : BaseCustomUIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    var showingShimmer: Bool = true
    var delegate: FeedListDelegate?
    
    func refresh(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showLoading(){
        showingShimmer = true
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func loadData(feeds: [FeedModel]){
        showingShimmer = false
        self.feeds = feeds
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    fileprivate var feeds: [FeedModel]?
    
    let feedCellId = "iFeedCell"
    
    func feedCount() -> Int{
        return feeds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2 shimmers will be shown
        return feedCount() == 0 ? 2 : feedCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellId, for: indexPath) as! FeedCollectionViewCell
        //handle case of error
        if showingShimmer {
            cell.feed = FeedState.loading
        }else{
            cell.feed = FeedState.data(feeds![indexPath.row])
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = getCellHeight(index: indexPath)
        return CGSize(width: Dimensions.FeedListView.getWidth(), height: cellHeight)
    }
    
    fileprivate func getCellHeight(index: IndexPath) -> CGFloat{
        if let feedList = feeds{
            let feed = feedList[index.row]
            let height = FeedCollectionViewCellHelper.calculateViewHeightFor(feed: feed)
            return height
        }
        return Dimensions.FeedListView.defaultHeight
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
}
