//
//  Api.swift
//  SwiftySteem
//
//  Created by Benedikt Veith on 20.02.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import Foundation

extension String {
    
    /// Converts a JSON String to valid JSON Object
    ///
    /// - Returns: JSON Object
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

public class Api {
    
    
    /// HttpClient instance
    var client : HttpClient!
    
    public init() {}
    
    
    /// Default config values (e.g API)
    let config_default : NSDictionary = [
        "api": "https://api.steemit.com"
    ]
    
    
    /// Init
    ///
    /// - Parameter config: Config Object; If empty config_default is used
    init(config: NSDictionary) {
        var configUsed = config
        let apiUri = configUsed["api"] as? String
        
        if apiUri == nil {
            configUsed = self.config_default
        }
        
        self.client = HttpClient(api: configUsed["api"] as! String)
    }

    // PRAGMA MARK: TAGS
    
    
    /// Get Trending Tags from the condenser API
    ///
    /// - Parameters:
    ///   - afterTag: First Tag to start with; Can be empty
    ///   - limit: Limit
    ///   - completion: Completion Block; Returns error and response objects
    public func getTrendingTags(afterTag: String, limit: Int, completion:((Any?, _ response: Any?) -> Void)?) {
        let getTrendingTags: GetTrendingTags = GetTrendingTags(jsonrpc: "2.0", id: 1, method: "get_trending_tags", params: [afterTag, String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getTrendingTags)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
                //      TODO: REPLACE JSON WITH CODABLES !
//                if let responseData = try? JSONDecoder().decode(ResponseGetTrendingTags.self, from: response!) {
//                    completion?(nil, responseData)
//
//                    return
//                }
                
                print("Decoding Error happend - get_trending_tags")
            }
        } catch {
            print("Error parsing JSON Data - get_trending_tags; AfterTag: \(afterTag); Limit: \(limit)");
            return;
        }
    }
    
    
    /// Get Discussions by Trending
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByTrending(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_trending", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_trending; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Created
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByCreated(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_created", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_created; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Active
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByActive(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_active", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_active; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Payout
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByPayout(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_payout", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_payout; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Cashout
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByCashout(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_cashout", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_cashout; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Votes
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByVotes(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_votes", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_votes; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Children
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByChildren(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_children", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_children; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Hot
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByHot(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_hot", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_hot; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Feed
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByFeed(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_feed", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_feed; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Blog
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByBlog(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_blog", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_blog; Query Object: \(query);");
            return;
        }
    }
    
    /// Get Discussions by Comments
    ///
    /// - Parameters:
    ///   - query: Query Object; See QueryDiscussionsBy for possible values
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByComments(query: QueryDiscussionsBy, completion:((Any?, Any?) -> Void)?) {
        let getDiscussionsByTrending: GetDiscussionsBy = GetDiscussionsBy(jsonrpc: "2.0", id: 1, method: "get_discussions_by_comments", params: [query])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getDiscussionsByTrending)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_comments; Query Object: \(query);");
            return;
        }
    }
    
    // PRAGMA MARK: BLOCKS AND TRANSACTIONS
    
    
    /// Returns a block
    ///
    /// - Parameters:
    ///   - blockNumber: Block Number; Starting from 1
    ///   - completion: Completion Block; Returns error and response objects
    public func getBlock(blockNumber: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_block", params: [blockNumber])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_block; Block Number: \(blockNumber)");
            return;
        }
    }
    
    
    /// Returns a Block Header
    ///
    /// - Parameters:
    ///   - blockNumber: Block Number; Starting from 1
    ///   - completion: Completion Block; Returns error and response objects
    public func getBlockHeader(blockNumber: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_block_header", params: [blockNumber])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_block_header; Block Number: \(blockNumber)");
            return;
        }
    }
    
    @available(*, deprecated)
    /// Returns the state of a path. Deprecated.
    ///
    /// - Parameters:
    ///   - blockNumber: Block Number; Starting from 1
    ///   - completion: Completion Block; Returns error and response objects
    public func getState(blockNumber: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_state", params: [blockNumber])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_state; Block Number: \(blockNumber)");
            return;
        }
    }
    
    // PRAGMA MARK: GLOBALS
    
    /// Returns information about compile-time constants.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getConfig(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_config")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_config;")
            return
        }
    }
    
    
    /// Returns the current dynamic global properties.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getDynamicGlobalProperties(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_dynamic_global_properties")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_dynamic_global_properties;")
            return
        }
    }
    
    
    /// Returns the chain properties.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getChainProperties(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_chain_properties")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_chain_properties;")
            return
        }
    }
    
    
    /// Returns the history of price feed values.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getFeedHistory(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_feed_history")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_feed_history;")
            return
        }
    }
    
    
    /// Returns the current median history price
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getCurrentMedianHistoryPrice(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_current_median_history_price")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_current_median_history_price;")
            return
        }
    }
    
    
    /// Returns the hardfork version
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getHardforkVersion(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_hardfork_version")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_hardfork_version;")
            return
        }
    }
    
    
    /// Returns the next scheduled hardfork
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getNextScheduledHardfork(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_next_scheduled_hardfork")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_next_scheduled_hardfork;")
            return
        }
    }
    
    
    /// Returns information about the current reward funds.
    ///
    /// - Parameters:
    ///   - name: Type (e.g post)
    ///   - completion: Completion Block; Returns error and response objects
    public func getRewardFund(name: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_reward_fund", params: [name])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_reward_fund;")
            return
        }
    }
    
    
    /// Returns the vesting delegations by an account.
    ///
    /// - Parameters:
    ///   - account: Accout name
    ///   - from: Start Number
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func getVestingDelegations(account: String, from: Int, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_vesting_delegations", params: [account, String(from), String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_vesting_delegations;")
            return
        }
    }
    
    // PRAGMA MARK: KEYS
    
    
    /// Returns all accounts that have the key associated with their owner or active authorities
    ///
    /// - Parameters:
    ///   - key: Key String
    ///   - completion: Completion Block; Returns error and response objects
    public func getKeyReferences(key: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
                "jsonrpc": "2.0",
                "id": 1,
                "method": "call",
                "params": ["account_by_key_api", "get_key_references", [[key]]]
            ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_key_references; KEY: \(key)")
            return
        }
    }
    
    // PRAGMA MARK: ACCOUNTS
    
    /// Returns accounts, queried by name.
    ///
    /// - Parameters:
    ///   - accounts: Array of account strings
    ///   - completion: Completion Block; Returns error and response objects
    public func getAccounts(accounts: [String], completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: GetAccounts = GetAccounts(jsonrpc: "2.0", id: 1, method: "get_accounts", params: [accounts])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_accounts; Data: \(accounts)");
            return;
        }
    }
    
    @available(*, deprecated)
    /// Get Account References. Deprecated
    ///
    /// - Parameters:
    ///   - id: Id
    ///   - completion: Completion Block; Returns error and response objects
    public func getAccountReferences(id: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_account_references", params: [id])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_account_references; ID: \(id)");
            return;
        }
    }
    
    
    /// Looks up account names
    ///
    /// - Parameters:
    ///   - accounts: Array of account strings
    ///   - completion: Completion Block; Returns error and response objects
    public func lookupAccountNames(accounts: [String], completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: GetAccounts = GetAccounts(jsonrpc: "2.0", id: 1, method: "lookup_account_names", params: [accounts])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - lookup_account_names; Data: \(accounts)");
            return;
        }
    }
    
    
    /// Looks up accounts starting with name.
    ///
    /// - Parameters:
    ///   - lowerBoundName: Lower Bound Name
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func lookupAccounts(lowerBoundName: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "call",
            "params": ["database_api", "lookup_accounts", [lowerBoundName, limit]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - lookup_accounts; Lower Bundle Name: \(lowerBoundName); Limit: \(limit)")
            return
        }
    }
    
    
    /// Get total account count
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getAccountCount(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: EmptyParam = EmptyParam(jsonrpc: "2.0", id: 1, method: "get_account_count")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_account_count;")
            return
        }
    }
    
    
    /// Returns a list of conversion request
    ///
    /// - Parameters:
    ///   - id: Id
    ///   - completion: Completion Block; Returns error and response objects
    public func getConversionRequests(id: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_conversion_requests", params: [id])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_conversion_requests; Account: \(id)");
            return;
        }
    }
    
    
    /// Used to lookup account history information.
    ///
    /// - Parameters:
    ///   - name: Accout name
    ///   - from: Starting Transaction Number
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func getAccountHistory(name: String, from: Int, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_account_history", params: [name, String(from), String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_accounts; Name: \(name); From: \(from); Limit: \(limit)");
            return;
        }
    }
    
    
    /// Returns the owner history of an account.
    ///
    /// - Parameters:
    ///   - account: Accout name
    ///   - completion: Completion Block; Returns error and response objects
    public func getOwnerHistory(account: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_owner_history", params: [account])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_owner_history; Account: \(account)");
            return;
        }
    }
    
    
    /// Returns the recovery request for an account.
    ///
    /// - Parameters:
    ///   - account: Account name
    ///   - completion: Completion Block; Returns error and response objects
    public func getRecoveryRequest(account: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_recovery_request", params: [account])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_recovery_request; Account: \(account)");
            return;
        }
    }
    
    // PRAGMA MARK: MARKET

    
    /// Returns the order book.
    ///
    /// - Parameters:
    ///   - limit: Limit
    ///   - completion: Completion Block; Returns error and response objects
    public func getOrderBook(limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleIntParam = SingleIntParam(jsonrpc: "2.0", id: 1, method: "get_order_book", params: [limit])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_order_book; Limit: \(limit)");
            return;
        }
    }
    
    
    /// Returns the open orders for an account.
    ///
    /// - Parameters:
    ///   - name: Account Name
    ///   - completion: Completion Block; Returns error and response objects
    public func getOpenOrders(account: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_open_orders", params: [account])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_open_orders; Name: \(account)");
            return;
        }
    }
    
    @available(*, deprecated)
    /// Get Liquidity Queue. Deprecated
    ///
    /// - Parameters:
    ///   - name: Account name
    ///   - limit: Limit
    ///   - completion: Completion Block; Returns error and response objects
    public func getLiquidityQueue(account: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_liquidity_queue", params: [account, String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_liquidity_queue; Name: \(account); Limit: \(limit)");
            return;
        }
    }
    
    // PRAGMA MARK: AUTHORITY / VALIDATION
    
    
    /// Returns the details of a transaction based on a transaction id.
    ///
    /// - Parameters:
    ///   - trxId: Transaction Id
    ///   - completion: Completion Block; Returns error and response objects
    public func getTransaction(trxId: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData: SingleStringParam = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_transaction", params: [trxId])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_transaction; TrxId: \(trxId)");
            return;
        }
    }
    
    
    /// Returns a hexdump of the serialized binary form of a transaction.
    ///
    /// - Parameters:
    ///   - trx: Transaction Id
    ///   - completion: Completion Block; Returns error and response objects
    public func getTransactionHex(trx: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_transaction_hex",
            "params": [["trx": trx]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_transaction_hex; Trx: \(trx)");
            return;
        }
    }
    
    
    /// This API will take a partially signed transaction and a set of public keys that the owner has the ability to sign for and return the minimal subset of public keys that should add signatures to the transaction.
    ///
    /// - Parameters:
    ///   - trx: Transaction Object
    ///   - availableKeys: Public Keys
    ///   - completion: Completion Block; Returns error and response objects
    public func getRequiredSignatures(trx: NSDictionary, availableKeys: [String], completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_required_signatures",
            "params": [["trx": trx], availableKeys]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_required_signatures; Trx: \(trx)");
            return;
        }
    }
    
    
    /// This method will return the set of all public keys that could possibly sign for a given transaction.
    ///
    /// - Parameters:
    ///   - trx: Transaction Object
    ///   - completion: Completion Block; Returns error and response objects
    public func getPotentialSignatures(trx: NSDictionary, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_potential_signatures",
            "params": [["trx": trx]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_potential_signatures; Trx: \(trx)");
            return;
        }
    }
    
    
    /// Returns true if the transaction has all of the required signatures.
    ///
    /// - Parameters:
    ///   - trx: Transaction Object
    ///   - completion: Completion Block; Returns error and response objects
    public func verifyAuthority(trx: NSDictionary, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "verify_authority",
            "params": [["trx": trx]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - verify_authority; Trx: \(trx)");
            return;
        }
    }
    
    
    /// Returns true if the signers have enough authority to authorize an account.
    ///
    /// - Parameters:
    ///   - name: Account Name
    ///   - key: Signer Key
    ///   - completion: Completion Block; Returns error and response objects
    public func verifyAccountAuthority(name: String, key: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "verify_account_authority",
            "params": [name, [key]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - verify_account_authority; Name: \(name); Key: \(key)");
            return;
        }
    }
    
    
    /// Returns all votes for the given post.
    ///
    /// - Parameters:
    ///   - author: Account name
    ///   - permlink: Post Permlink
    ///   - completion: Completion Block; Returns error and response objects
    public func getActiveVotes(author: String, permlink: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_active_votes", params: [author, permlink])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_active_votes; Author: \(author); Permlink: \(permlink)");
            return;
        }
    }
    
    
    /// Returns all votes by an account.
    ///
    /// - Parameters:
    ///   - account: Account Name
    ///   - completion: Completion Block; Returns error and response objects
    public func getAccountVotes(account: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_account_votes", params: [account])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_account_votes; Account: \(account)");
            return;
        }
    }
    
    
    /// Returns the content (post or comment).
    ///
    /// - Parameters:
    ///   - author: Account Name
    ///   - permlink: Post Permlink
    ///   - completion: Completion Block; Returns error and response objects
    public func getContent(author: String, permlink: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_content", params: [author, permlink])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_content; Author: \(author); Permlink: \(permlink)");
            return;
        }
    }
    
    
    /// Returns a list of replies.
    ///
    /// - Parameters:
    ///   - author: Account Name
    ///   - permlink: Post Permlink
    ///   - completion: Completion Block; Returns error and response objects
    public func getContentReplies(author: String, permlink: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_content_replies", params: [author, permlink])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_content_replies; Author: \(author); Permlink: \(permlink)");
            return;
        }
    }
    
    
    /// Returns a list of discussions based on author before date.
    ///
    /// - Parameters:
    ///   - author: Account Name
    ///   - startPermlink: Post Permlink
    ///   - beforeDate: Date
    ///   - limit: Limit
    ///   - completion: Completion Block; Returns error and response objects
    public func getDiscussionsByAuthorBeforeDate(author: String, startPermlink: String, beforeDate: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_discussions_by_author_before_date", params: [author, startPermlink, beforeDate, String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_discussions_by_author_before_date; Author: \(author); startPermlink: \(startPermlink); beforeDate: \(beforeDate); limit: \(limit)");
            return;
        }
    }
    
    
    /// Returns a list of replies by last update.
    ///
    /// - Parameters:
    ///   - author: Account Name
    ///   - permlink: Post Permlink
    ///   - limit: Limit; Up to 100
    ///   - completion: Completion Block; Returns error and response objects
    public func getRepliesByLastUpdate(author: String, permlink: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData = SingleStringParam(jsonrpc: "2.0", id: 1, method: "get_replies_by_last_update", params: [author, permlink, String(limit)])
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(getAccountsData)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_replies_by_last_update; author: \(author); permlink: \(permlink); limit: \(limit)");
            return;
        }
    }
    
    //PRAGMA MARK: WITNESSES
    
    
    /// Returns current witnesses.
    ///
    /// - Parameters:
    ///   - witnessIds: Witness Ids; Can be empty
    ///   - completion: Completion Block; Returns error and response objects
    public func getWitnesses(witnessIds: [String], completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_witnesses",
            "params": [witnessIds]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_witnesses; witnessIds: \(witnessIds)");
            return;
        }
    }
    
    
    /// Returns the witness of an account.
    ///
    /// - Parameters:
    ///   - name: Account Name
    ///   - completion: Completion Block; Returns error and response objects
    public func getWitnessByAccount(name: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_witness_by_account",
            "params": [name]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_witness_by_account; Name: \(name)");
            return;
        }
    }
    
    
    /// Returns current witnesses by vote.
    ///
    /// - Parameters:
    ///   - from: Start account
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func getWitnessesByVote(from: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_witnesses_by_vote",
            "params": [from, String(limit)]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_witnesses_by_vote; From: \(from); Limit: \(limit)");
            return;
        }
    }
    
    
    /// Looks up witness accounts starting with name.
    ///
    /// - Parameters:
    ///   - lowerBoundName: Name
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func lookupWitnessAccounts(lowerBoundName: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "lookup_witness_accounts",
            "params": [lowerBoundName, String(limit)]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - lookup_witness_accounts; lowerBoundName: \(lowerBoundName); limit: \(limit)");
            return;
        }
    }
    
    
    /// Returns the witness count.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getWitnessCount(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_witness_count"
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_witness_count;");
            return;
        }
    }
    
    
    /// Returns all active witnesses.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getActiveWitnesses(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_active_witnesses"
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_active_witnesses;");
            return;
        }
    }
    
    @available(*, deprecated)
    /// Deprecated.
    ///
    ///   - completion: Completion Block; Returns error and response objects
    public func getMinerQueue(completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "get_miner_queue"
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_miner_queue;");
            return;
        }
    }
    
    //PRAGMA MARK: FOLLOW
    
    
    /// Returns the list of followers for an account.
    ///
    /// - Parameters:
    ///   - name: Account Name
    ///   - start: Starting name of follower; Can be Empty
    ///   - type: Follow Type (e.g blog, ignore)
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func getFollowers(name: String, start: String, type: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "call",
            "params": ["follow_api", "get_followers", [name, start, type, String(limit)]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_followers;");
            return;
        }
    }
    
    
    /// Returns the follower count for an account
    ///
    /// - Parameters:
    ///   - account: Account Name
    ///   - completion: Completion Block; Returns error and response objects
    public func getFollowCount(account: String, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "call",
            "params": ["follow_api", "get_follow_count", [account]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_followers;");
            return;
        }
    }
    
    
    /// Returns the list of accounts that are following an account.
    ///
    /// - Parameters:
    ///   - name: Account Name
    ///   - start: Start Account Name; Can be empty
    ///   - type: Follow Type (e.g blog, ignore)
    ///   - limit: Limit; Up to 1000
    ///   - completion: Completion Block; Returns error and response objects
    public func getFollowing(name: String, start: String, type: String, limit: Int, completion:((Any?, Any?) -> Void)?) {
        let getAccountsData : [String : Any] = [
            "jsonrpc": "2.0",
            "id": 1,
            "method": "call",
            "params": ["follow_api", "get_following", [name, start, type, String(limit)]]
        ];
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: getAccountsData, options: .prettyPrinted)
            
            self.client.useEndpoint(jsonData: jsonData) { (error, response) in
                guard error == nil else {
                    completion!(error, nil)
                    return
                }
                
                completion!(nil, response)
            }
        } catch {
            print("Error parsing JSON Data - get_following;");
            return;
        }
    }
}
