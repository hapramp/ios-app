//
//  FeedsApi.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Alamofire
import UIKit

extension ApiRequests{
    static let DefaultExploreFeedLimit = 5
    
    public func fetchExploreFeeds(completion: @escaping (_ feeds: [FeedModel]?, _ errorMessage: String) -> ()){
        let urlString = Endpoints.Feeds.exploreFeeds
        Alamofire.request(urlString).responseData { (responseData) in
            if responseData.error != nil{
                completion(nil, (responseData.error?.localizedDescription)!)
            }else{
                let jsonDecoder = JSONDecoder()
                do{
                    if let data = responseData.data{
                        let feedItems = try jsonDecoder.decode([FeedModel].self, from: data)
                        completion(feedItems,"success")
                    }
                }catch let error{
                    print(error)
                    completion(nil, error.localizedDescription)
                }
            }
        }
    }
    
    public func fetchExploreFeeds(limit: Int, start_author: String, start_permlink: String,completion: @escaping (_ feeds: [FeedModel]?, _ errorMessage: String) -> ()){
        let urlString = Endpoints.Feeds.exploreFeedsWith(limit, start_author, start_permlink)
        Alamofire.request(urlString).responseData { (responseData) in
            if responseData.error != nil{
                completion(nil, (responseData.error?.localizedDescription)!)
            }else{
                let jsonDecoder = JSONDecoder()
                do{
                    if let data = responseData.data{
                        print("response \(data)")
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                        print("Json: \(json)")
                        let feedItems = try jsonDecoder.decode([FeedModel].self, from: data)
                        completion(feedItems,"success")
                    }
                }catch let error{
                    print(error)
                    completion(nil, error.localizedDescription)
                }
            }
        }
    }
    
}
