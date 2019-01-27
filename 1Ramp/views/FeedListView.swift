//
//  FeedListView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedListView : BaseCustomUIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
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
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        //get the highest
        for indexPath in indexPaths{
            if indexPath.row>=(feedCount-2) && indexPath.row<=feedCount && haveMoreFeeds{
                if prefetchingForIndex != feedCount{
                    loadMoreFeedsAfter(index: feedCount-1)
                    prefetchingForIndex = feedCount
                }
            }
        }
    }
    
    func loadMoreFeedsAfter(index: Int){
        if let feeds = feeds{
            let lastFeed = feeds[index]
            delegate?.onLoadMoreFeedsWith(limit: ApiRequests.DefaultExploreFeedLimit, start_author: lastFeed.author, start_permlink: lastFeed.permlink)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("cancel prefetching at: \(indexPaths)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedCount == 0 ? 2 : feedCount + (haveMoreFeeds ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellId, for: indexPath) as! FeedCollectionViewCell
        let feedState = getFeedStateAt(row: indexPath.row)
        cell.feed = feedState
        return cell
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = getCellHeight(index: indexPath)
        return CGSize(width: Dimensions.FeedListView.getWidth(), height: cellHeight)
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
        setupCollectionView()
    }
}
