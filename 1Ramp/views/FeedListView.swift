//
//  FeedListView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedListView : BaseCustomUIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedCount == 0 ? 2 : feedCount + (haveMoreFeeds ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print("Prefetching on the go")
        for indexPath in indexPaths{
            if indexPath.row>=(feedCount-2) && indexPath.row<=feedCount && haveMoreFeeds{
                if prefetchingForIndex != feedCount{
                    loadMoreFeedsAfter(index: feedCount-1)
                    prefetchingForIndex = feedCount
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellId, for: indexPath) as! FeedCollectionViewCell
        let feedState = getFeedStateAt(row: indexPath.row)
        cell.feed = feedState
        return cell
    }
    
    var haveMoreFeeds : Bool = true
    var feeds: [FeedModel]?
    var delegate: FeedListDelegate?
    let feedCellId = "iFeedCell"
    var _lastContentOffset : CGPoint?
    var feedCount: Int = 0
    var prefetchingForIndex: Int = 0
    
    func setFeeds(feeds: [FeedModel]){
        self.feeds = feeds
        self.feedCount = feeds.count
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func appendFeeds(newFeeds: [FeedModel]){
        if newFeeds.count < ApiRequests.DefaultExploreFeedLimit{
            haveMoreFeeds = false
        }
        for feed in newFeeds{
            feeds?.append(feed)
        }
        self.feedCount = feeds!.count
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func getCellHeight(index: IndexPath) -> CGFloat{
        if let feedList = feeds{
            if index.row < feedList.count{
                let feed = feedList[index.row]
                let height = Dimensions.FeedCollectionViewCell.calculateViewHeightFor(feed: feed)
                return height
            }
        }
        return Dimensions.FeedListView.defaultHeight
    }
    
    func loadMoreFeedsAfter(index: Int){
        if let feeds = feeds{
            let lastFeed = feeds[index]
            delegate?.onLoadMoreFeedsWith(limit: ApiRequests.DefaultExploreFeedLimit, start_author: lastFeed.author, start_permlink: lastFeed.permlink)
        }
    }
    
    func getFeedStateAt(row: Int) -> FeedState{
        //initial loading
        if row < feedCount{
            // feeds are there
            return .data(feeds![row])
        }else{
            return .loading
        }
    }
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(collectionView)
        setupCollectionView()
    }
    
    let columnLayout = FlowLayout()
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.alwaysBounceVertical = true
        collectionView.collectionViewLayout = columnLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        
        collectionView.isPrefetchingEnabled = true
        collectionView.prefetchDataSource = self

        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellId)
    }
}
