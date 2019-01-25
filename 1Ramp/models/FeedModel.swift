//
//  FeedModel.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//
import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let feedModel = try? newJSONDecoder().decode(FeedModel.self, from: jsonData)

import Foundation

struct FeedModel: Codable {
    let id: Int
    let author: String
    let permlink: String
    let category: String
    let parentAuthor: String
    let parentPermlink: String
    let title: String
    let body: String
    let jsonMetadata: MixedJsonMetadata
    let lastUpdate: String
    let created: String
    let active: String
    let lastPayout: String
    let depth: Int
    let children: Int
    let cashoutTime: String
    let maxCashoutTime: String
    let totalVoteWeight: Int
    let rewardWeight: Int
    let totalPayoutValue: String
    let curatorPayoutValue: String
    let authorRewards: Int
    let netVotes: Int
    let rootAuthor: String
    let rootPermlink: String
    let maxAcceptedPayout: String
    let percentSteemDollars: Int
    let allowReplies: Bool
    let allowVotes: Bool
    let allowCurationRewards: Bool
    let beneficiaries: [Beneficiary]
    let url: String
    let rootTitle: String
    let pendingPayoutValue: String
    let totalPendingPayoutValue: String
    let activeVotes: [ActiveVote]
    let authorReputation: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case permlink = "permlink"
        case category = "category"
        case parentAuthor = "parent_author"
        case parentPermlink = "parent_permlink"
        case title = "title"
        case body = "body"
        case jsonMetadata = "json_metadata"
        case lastUpdate = "last_update"
        case created = "created"
        case active = "active"
        case lastPayout = "last_payout"
        case depth = "depth"
        case children = "children"
        case cashoutTime = "cashout_time"
        case maxCashoutTime = "max_cashout_time"
        case totalVoteWeight = "total_vote_weight"
        case rewardWeight = "reward_weight"
        case totalPayoutValue = "total_payout_value"
        case curatorPayoutValue = "curator_payout_value"
        case authorRewards = "author_rewards"
        case netVotes = "net_votes"
        case rootAuthor = "root_author"
        case rootPermlink = "root_permlink"
        case maxAcceptedPayout = "max_accepted_payout"
        case percentSteemDollars = "percent_steem_dollars"
        case allowReplies = "allow_replies"
        case allowVotes = "allow_votes"
        case allowCurationRewards = "allow_curation_rewards"
        case beneficiaries = "beneficiaries"
        case url = "url"
        case rootTitle = "root_title"
        case pendingPayoutValue = "pending_payout_value"
        case totalPendingPayoutValue = "total_pending_payout_value"
        case activeVotes = "active_votes"
        case authorReputation = "author_reputation"
    }
}

struct JSONMetadata: Codable {
    let app: String?
    let format: String?
    let image: [String]?
    let tags: [String]?
    
    enum CodingKeys: String, CodingKey {
        case app = "app"
        case format = "format"
        case image = "image"
        case tags = "tags"
    }
}


struct ActiveVote: Codable {
    let voter: String
    let weight: Int
    let rshares: MixedRshare
    let percent: Int
    let reputation: Int
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case voter = "voter"
        case weight = "weight"
        case rshares = "rshares"
        case percent = "percent"
        case reputation = "reputation"
        case time = "time"
    }
}

struct Beneficiary: Codable {
    let account: String
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case weight = "weight"
    }
}

//MixedRshare
enum MixedRshare: Codable{
    case string(String)
    case integer(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self){
            self = .string(x)
            return
        }
        
        if let x = try? container.decode(Int.self){
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(MixedRshare.self, DecodingError.Context.init(codingPath: decoder.codingPath, debugDescription: "cannot parse rshare"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
        
    }
}

//MixedJsonMetadata
enum MixedJsonMetadata: Codable{
    case metadata(JSONMetadata)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        //try decoding of type string
        if let stringDecode = try? container.decode(String.self){
            //it means json_metadata was of string type
            let data = stringDecode.data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            do{
                let objectDecode = try jsonDecoder.decode(JSONMetadata.self, from: data!)
                self = .metadata(objectDecode)
                return
            }catch{
                print(error)
            }
        }
        
        if let objectDecode = try? container.decode(JSONMetadata.self){
            self = .metadata(objectDecode)
            return
        }
        
        let context = DecodingError.Context(codingPath: [], debugDescription: "cannot parse json_metadata")
        throw DecodingError.typeMismatch(MixedJsonMetadata.self, context)
    }
    
    func encode(to encoder: Encoder) throws {
        //donot need it for now
        var container = encoder.singleValueContainer()
        switch self {
        case .metadata(let jsonmetadata):
            try container.encode(jsonmetadata)
        }
    }
}
