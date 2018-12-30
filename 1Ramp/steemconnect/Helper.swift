//
//  Helper.swift
//  SwiftyConnect
//
//  Created by Benedikt Veith on 27.03.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import Foundation

extension String {
    mutating func removingRegexMatches(pattern: String, replaceWith: String = "") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return
        }
    }
}

public class Helper {
    
    public init() {}
    
    
    /// Calculates the steem power value from Vests
    ///
    /// - Parameters:
    ///   - vestingShares: The Vests value, make sure to include VESTS (e.g '100 VESTS')
    ///   - completion: Completion Block; Returns error and the resulting steem power value
    public func calculateSteempower(vestingShares: String, callback:((Any?, Float?) -> Void)?) {
        Steem.sharedInstance.api.getDynamicGlobalProperties { (error, response) in
            guard error == nil else {
                callback!(error, nil)
                return;
            }
            
            let resp = response as! NSDictionary
            let result = resp["result"] as! NSDictionary
            
            let totalVestingFundSteem = result["total_vesting_fund_steem"] as! String
            let totalVestingShares = result["total_vesting_shares"] as! String
            
            let steempower = Float(totalVestingFundSteem.split(separator: " ")[0])! * (Float(vestingShares.split(separator: " ")[0])! / Float(totalVestingShares.split(separator: " ")[0])!)
            
            callback!(nil, steempower)
        }
    }
    
    
    /// Calculates the voting power, depending on current voting power and last vote time
    ///
    /// - Parameters:
    ///   - votingPower: Current Voting Power as Integer
    ///   - lastVoteTime: Last Voting Time as String
    /// - Returns: Voting Power Value
    public func getVotingPower(votingPower: Int, lastVoteTime: String) -> Double {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        let last_vote_time = dateFormatter.date(from: lastVoteTime)
        let today = Date()
        
        let secondsAgo = today.timeIntervalSince(last_vote_time!)
        
        let vpow = Double(votingPower) + (10000 * secondsAgo / 432000)
        
        return min(vpow / 100, 100)
    }
    
    
    /// Creates a comment permlink for a post
    ///
    /// - Parameters:
    ///   - parentAuthor: Parent Post Author
    ///   - parentPermlink: Parent Post Permlink
    /// - Returns: New Permlink Value
    public func createCommentPermlink(parentAuthor: String, parentPermlink: String) -> String {
        var permlink = parentPermlink
        let nowTimestamp = Date().timeIntervalSince1970
        
        permlink.removingRegexMatches(pattern: "/(-\\d+.\\d+)/g", replaceWith: "")
        
        return "re-\(parentAuthor)-\(permlink)-\(nowTimestamp)"
    }
    
    
    /// Fetches the current steem and sbd prices from coinmarketcap's api
    ///
    /// - Parameters:
    ///   - currency: Which currency value should the prices have (e.g USD, EUR, CAD)
    ///   - completion: Completion Block; Returns error and response object containing sbd / steem prices
    public func getSteemAndSbdPrices(currency: String, callback:((Any?, NSDictionary?) -> Void)?) {
        Steem.sharedInstance.api.client.getData(url: "https://api.coinmarketcap.com/v1/ticker/steem/?convert=\(currency)") { (error, response) in
            guard error == nil else {
                callback!(error, nil)
                return
            }
            
            let steem = (response as! NSDictionary)["price_\(currency.lowercased())"] as! String
            
            Steem.sharedInstance.api.client.getData(url: "https://api.coinmarketcap.com/v1/ticker/steem-dollars/?convert=\(currency)") { (error, response) in
                guard error == nil else {
                    callback!(error, nil)
                    return
                }
                
                let sbd = (response as! NSDictionary)["price_\(currency.lowercased())"] as! String
                
                callback!(error, [
                    "steem": steem,
                    "sbd": sbd
                ])
            }
        }
    }
    
    
    /// Converts any STEEM / SBD value to its currency value
    ///
    /// - Parameters:
    ///   - value: STEEM / SBD value (e.g '10 SBD')
    ///   - currency: Currency to convert to (e.g USD, EUR, CAD)
    ///   - completion: Completion Block; Returns error and the converted currency as Double
    public func convertToCurrency(value: String, currency: String, callback:((Any?, Double?) -> Void)?) {
        let splittedRef = value.split(separator: " ")
        var converted = 0.0
        
        Steem.sharedInstance.helper.getSteemAndSbdPrices(currency: currency) { (error, response) in
            guard error == nil else {
                callback!(error, nil)
                return
            }
            
            let steemPrice = Double(response!["steem"] as! String)
            let sbdPrice = Double(response!["sbd"] as! String)
            
            switch splittedRef[1] {
            case "STEEM":
                converted = Double(splittedRef[0])! * steemPrice!
                break
            case "SBD":
                converted = Double(splittedRef[0])! * sbdPrice!
                break
            default:
                break
            }
            
            callback!(nil, converted)
        }
    }
    
    
    /// Check if an account name is valid
    ///
    /// - Parameter name: Account name
    /// - Returns: Nil if valid, else error message
    public func validAccountName(name: String) -> String? {
        if name.count == 0 {
            return "Account name should not be empty"
        } else if name.count < 3 {
            return "Account name should be longer"
        } else if name.count > 16 {
            return "Account namr should be shorter"
        }
        
        let ref = name.split(separator: ".")
        for label in ref {
            
            var regex = try! NSRegularExpression(pattern: "^[a-z]", options: [])
            var matches = regex.matches(in: String(label), options: [], range: NSRange(location: 0, length: label.count))
            
            guard matches.count != 0 else {
                return "Each account segment should start with a letter";
            }
            
            regex = try! NSRegularExpression(pattern: "^[a-z0-9-]*$", options: [])
            matches = regex.matches(in: String(label), options: [], range: NSRange(location: 0, length: label.count))
            
            guard matches.count != 0 else {
                return "Each account segment should have only letters, digits, or dashes";
            }
            regex = try! NSRegularExpression(pattern: "--", options: [])
            matches = regex.matches(in: String(label), options: [], range: NSRange(location: 0, length: label.count))
            
            guard matches.count == 0 else {
              return "Each account segment should have only one dash in a row";
            }
            
            regex = try! NSRegularExpression(pattern: "[a-z0-9]$", options: [])
            matches = regex.matches(in: String(label), options: [], range: NSRange(location: 0, length: label.count))
            
            guard matches.count != 0 else {
              return "Each account segment should end with a letter or digit";
            }

            guard label.count >= 3 else {
              return "Each account segment should be longer";
            }
        }

        
        return nil
    }
    
    
    /// Convert reputation to readable value
    ///
    /// - Parameter rawReputation: Raw reputation value
    /// - Returns: Readable Reputation value
    public func reputation(rawReputation: Double) -> Double {
        let log_10 = log10(rawReputation)
        let reputation = ((log_10 - 9) * 9) + 25
        
        return floor(reputation)
    }
    
    
    /// Paginate through whole account history
    ///
    /// - Parameters:
    ///   - name: Account name
    ///   - steps: How many transactions should be loaded per request
    ///   - pageSteps: How many transactions should be per page
    ///   - maxLimit: Max. amount of transactions which should get fetched (loading all transactions, can take a long time); Can be nil to load whole history
    ///   - completion: Completion Block; Returns error and response objects
    public func paginateAccountHistory(name: String, steps: Int, pageSteps: Int, maxLimit: Int?, completion:((Any?, Any?) -> Void)?) {
        var start = -1
        var page = 0
        var steps = steps
        var done = false
        var asyncRequest = false
        var allTransactions : [NSDictionary] = []
        var paginated : [[NSDictionary]] = [[]]
        
        while !done {
            guard asyncRequest == false else {
                continue
            }

            asyncRequest = true
            Steem.sharedInstance.api.getAccountHistory(name: name, from: start, limit: steps, completion: { (error, response) in
                guard error == nil else {
                    done = true
                    completion!(error, nil)
                    return
                }
                
                let response = response as! NSDictionary
                let result = response["result"] as! [NSArray]
                let length = result.count - 1
                if length == 0 {
                    done = true
                    return
                }
                
                for (index, trx) in result.enumerated() {
                    allTransactions.append(trx[1] as! NSDictionary)
                    
                    if paginated[page].count >= pageSteps {
                        page = page + 1
                        paginated.append([])
                    }
                    
                    paginated[page].append(trx[1] as! NSDictionary)

                    if index == length {
                        if start == -1 {
                            start = 0
                        }

                        start = (trx[0] as! Int) - length
                    }
                }
                
                if maxLimit != nil && allTransactions.count > maxLimit! {
                    done = true
                }
                
                if (start < steps) {
                    steps = start
                }
                
                if (start < 0) {
                    let newLimit = start + length
                    start = 0
                    steps = newLimit
                }
                
                if (start == 0 && steps == 0) {
                    done = true
                }

                asyncRequest = false
            })
        }
        
        completion!(nil, paginated)
    }
}
