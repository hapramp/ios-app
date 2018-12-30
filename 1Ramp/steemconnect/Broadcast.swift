//
//  Broadcast.swift
//  SwiftySteem
//
//  Created by Benedikt Veith on 27.02.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import Foundation

public struct JSONMetadata: Codable {
    let tags: [String]
    let links: [String]?
    let image: [String]?
    let format: String
    let app: String
    
    public init(tags: [String], links: [String]?, image: [String]?, format: String, app: String) {
        self.tags = tags
        self.links = links
        self.image = image
        self.format = format
        self.app = app
    }
}

enum StringifyError: Error {
    case isNotValidJSONObject
}

struct JSONStringify {
    
    let value: Any
    
    
    /// Converts NSDictionary to valid JSON string
    ///
    /// - Parameter prettyPrinted: if json string should be pretty printed
    /// - Returns: JSON String
    /// - Throws: StringifyError, if not valid JSON Object
    func stringify(prettyPrinted: Bool = false) throws -> String {
        let options: JSONSerialization.WritingOptions = prettyPrinted ? .prettyPrinted : .init(rawValue: 0)
        if JSONSerialization.isValidJSONObject(self.value) {
            let data = try JSONSerialization.data(withJSONObject: self.value, options: options)
            if let string = String(data: data, encoding: .utf8) {
                return string
                
            }
        }
        throw StringifyError.isNotValidJSONObject
    }
}
protocol Stringifiable {
    func stringify(prettyPrinted: Bool) throws -> String
}

extension Stringifiable {
    func stringify(prettyPrinted: Bool = false) throws -> String {
        return try JSONStringify(value: self).stringify(prettyPrinted: prettyPrinted)
    }
}

extension Dictionary: Stringifiable {}

public class Broadcast {
    
    public init() {}
    
    
    /// Vote for a post
    ///
    /// - Parameters:
    ///   - voter: Voter account name
    ///   - author: Author account name
    ///   - permlink: Post Permlin
    ///   - weight: Vote weight (max 10000)
    ///   - completion: Returns JSON Object
    public func vote(voter: String, author: String, permlink: String, weight: Int, completion:((JSONString) -> Void)?) {
        Steem.sharedInstance.auth.call(url: "/broadcast", data: [
            "operations": [
                ["vote", [
                    "voter": voter,
                    "author": author,
                    "permlink": permlink,
                    "weight": weight
                    ]
                ]
            ]
        ], callback: completion!)
    }
    
    
    /// Reblog a post
    ///
    /// - Parameters:
    ///   - account: Reblogger account name
    ///   - author: Author account name
    ///   - permlink: Post permlin
    ///   - completion: Returns JSON Object
    public func reblog(account: String, author: String, permlink: String, completion:((JSONString) -> Void)?) {
        do {
            let json = try JSONStringify(value: [
                "reblog",
                [
                    "account": account,
                    "author": author,
                    "permlink": permlink
                ]
            ]).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["custom_json", [
                        "required_auths": [],
                        "required_posting_auths": [account],
                        "id": "follow",
                        "json": json
                        ]
                    ]
                ]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
        }
    }
    
    
    /// Post custom json inside account transaction history
    ///
    /// - Parameters:
    ///   - account: account name
    ///   - json: custom json data
    ///   - completion: Returns JSON Object
    public func customJSON(account: String, json: JSONString, completion:((JSONString) -> Void)?) {
        do {
            let json = try JSONStringify(value: json).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["custom_json", [
                        "required_auths": [],
                        "required_posting_auths": [account],
                        "id": "follow",
                        "json": json
                        ]
                    ]]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
        }
    }
    
    // PRAGMA MARK: FOLLOW API
    
    
    /// Follow an account
    ///
    /// - Parameters:
    ///   - follower: Follower account name
    ///   - following: Following account name
    ///   - completion: Returns JSON Object
    public func follow(follower: String, following: String, completion:((JSONString) -> Void)?) {
        do {
            let json = try JSONStringify(value: [
                "follow",
                [
                    "follower": follower,
                    "following": following,
                    "what": ["blog"]
                ]
            ]).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["custom_json", [
                        "required_auths": [],
                        "required_posting_auths": [follower],
                        "id": "follow",
                        "json": json]
                    ]
                ]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
        }
    }
    
    
    /// Unfollow an account
    ///
    /// - Parameters:
    ///   - unfollower: Unfollower account name
    ///   - unfollowing: Unfollowing account name
    ///   - completion: Returns JSON Object
    public func unfollow(unfollower: String, unfollowing: String, completion:((JSONString) -> Void)?) {
        do {
            let json = try JSONStringify(value: [
                "follow",
                [
                    "follower": unfollower,
                    "following": unfollowing,
                    "what": []
                ]
            ]).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["custom_json", [
                        "required_auths": [],
                        "required_posting_auths": [unfollower],
                        "id": "follow",
                        "json": json]
                    ]
                ]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
        }
    }
    
    
    /// Ignore an account
    ///
    /// - Parameters:
    ///   - follower: Ignorer account name
    ///   - following: Ignoring account name
    ///   - completion: Returns JSON Object
    public func ignore(follower: String, following: String, completion:((JSONString) -> Void)?) {
        do {
            let json = try JSONStringify(value: [
                "follow",
                [
                    "follower": follower,
                    "following": following,
                    "what": ["ignore"]
                ]
            ]).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["custom_json", [
                        "required_auths": [],
                        "required_posting_auths": [follower],
                        "id": "follow",
                        "json": json]
                    ]
                ]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
        }
    }
    
    // PRAGMA MARK: CLAIM
    
    
    /// Claim Account Rewards Balance
    ///
    /// - Parameters:
    ///   - account: account name
    ///   - rewardSBD: SBD Amount to claim
    ///   - rewardSteem: Steem Amount to claim
    ///   - rewardVests: Vests (SP) Amount to claim
    ///   - completion: Returns JSON Object
    public func claimRewardBalance(account: String, rewardSBD: String, rewardSteem: String, rewardVests: Int, completion:((JSONString) -> Void)?) {
        Steem.sharedInstance.auth.call(url: "/broadcast", data: [
            "operations": [
                ["claim_reward_balance", [
                    "account": account,
                    "reward_sbd": rewardSBD,
                    "reward_steem": rewardSteem,
                    "reward_vests": rewardVests
                    ]
                ]
            ]
        ], callback: completion!)
    }
    
    // PRAGMA MARK: COMMENT
    
    
    /// Create a post or comment
    ///
    /// - Parameters:
    ///   - parentAuthor: If commenting else empty
    ///   - parentPermlink: If commenting else empty
    ///   - author: Author account name
    ///   - permlink: Post Permlink
    ///   - title: Post Title
    ///   - body: Post Content
    ///   - jsonMetadata: Post JSON Metada; see JSONMetadata for possible values
    ///   - completion: Returns JSON Object
    public func comment(parentAuthor: String?, parentPermlink: String?, author: String, permlink: String, title: String, body: String, jsonMetadata: JSONMetadata, completion:((JSONString) -> Void)?) {
        
        do {
            let jsonData = try JSONStringify(value: [
                    "app": jsonMetadata.app,
                    "format": jsonMetadata.format,
                    "image": jsonMetadata.image ?? [],
                    "links": jsonMetadata.links ?? [],
                    "tags": jsonMetadata.tags,
                ]).stringify()
            
            Steem.sharedInstance.auth.call(url: "/broadcast", data: [
                "operations": [
                    ["comment", [
                        "parent_author": parentAuthor ?? "",
                        "parent_permlink": parentPermlink ?? "",
                        "author": author,
                        "permlink": permlink,
                        "title": title,
                        "body": body,
                        "json_metadata": jsonData
                        ]
                    ]
                ]
            ], callback: completion!)
        } catch let error {
            print(error)
            completion!(["error": error])
            return;
        }
    }
    
    
    /// Set Comment Options to an Post
    ///
    /// - Parameters:
    ///   - author: Author account name
    ///   - permlink: Post Permlink
    ///   - maxAcceptedPayout: Max Accepted Payout
    ///   - percentSteemDollars: Should be 10000
    ///   - allowVotes: Allow Votes on Post
    ///   - allowCurationRewards: Allow Curation Rewards on Post
    ///   - extensions: Extensions (e.g beneficiaries)
    ///   - completion: Returns JSON Object
    public func commentOptions(author : String, permlink: String, maxAcceptedPayout: String?, percentSteemDollars: Int?, allowVotes : Bool, allowCurationRewards : Bool, extensions: NSDictionary?, completion:((JSONString) -> Void)?) {
        
        Steem.sharedInstance.auth.call(url: "/broadcast", data: [
            "operations": [
                ["comment_options", [
                    "author": author,
                    "permlink": permlink,
                    "max_accepted_payout": maxAcceptedPayout ?? "1000000.000 SBD",
                    "percent_steem_dollars": percentSteemDollars ?? 10000,
                    "allow_votes": allowVotes,
                    "allow_curation_rewards": allowCurationRewards,
                    "extensions": extensions ?? ""
                ]]
            ]
        ], callback: completion!)
    }
    
    
    /// Deletes a Post
    ///
    /// - Parameters:
    ///   - author: Author account name
    ///   - permlink: Post Permlink
    ///   - completion: Returns JSON Object
    public func commentDelete(author : String, permlink: String, completion:((JSONString) -> Void)?) {
        Steem.sharedInstance.auth.call(url: "/broadcast", data: [
            "operations": [
                ["delete_comment", [
                    "author": author,
                    "permlink": permlink
                ]]
            ]
        ], callback: completion!)
    }
}
