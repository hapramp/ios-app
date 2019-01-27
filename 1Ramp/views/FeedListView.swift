//
//  FeedListView.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class FeedListView : BaseCustomUIView, UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCount == 0 ? 2 : feedCount + (haveMoreFeeds ? 1 : 0)
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellHeight(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedCellId, for: indexPath) as! FeedTableViewCell
        let feedState = getFeedStateAt(row: indexPath.row)
        cell.feed = feedState
        return cell
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        //get the highest
        for indexPath in indexPaths{
            print("Prefetch row \(indexPath.row)")
//            if indexPath.row>=(feedCount-2) && indexPath.row<=feedCount && haveMoreFeeds{
//                if prefetchingForIndex != feedCount{
//                    loadMoreFeedsAfter(index: feedCount-1)
//                    prefetchingForIndex = feedCount
//                }
//            }
        }
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
            self.tableView.reloadData()
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
            self.tableView.reloadData()
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
    
    let tableView: UITableView = {
        let cv = UITableView(frame: .zero)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(tableView)
        setupTableView()
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellId)
    }
}
