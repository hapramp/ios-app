//
//  FeedListView+handlers.swift
//  1Ramp
//
//  Created by Ankit Kumar on 26/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

extension FeedListView: UITableViewDataSourcePrefetching{

    func refresh(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoading(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
}
