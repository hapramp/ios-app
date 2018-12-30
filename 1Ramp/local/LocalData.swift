//
//  LocalData.swift
//  1Ramp
//
//  Created by Ankit Kumar on 28/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import CoreData
class LocalData{
    let userTokenKey = "user_token"
    let usernameKey = "username"
    let accessTokenKey = "access_token"
    let isLoggedInKey = "is_logged_in"
    let userJsonKey = "user_json"
    let allInterestsKey = "all_interests"
    
    public static let sharedInstance = LocalData()
    let coreUtils: CoreDataUtils = {
        return CoreDataUtils()
    }()
    
    public func setUserToken(userToken: String){
        coreUtils.udpateOrInsertNewValue(forKey: userTokenKey, value: userToken)
    }
    
    public func getUserToken() -> String{
        if let userToken = coreUtils.getValue(forKey: userTokenKey) as? String{
            return userToken
        }
        return ""
    }
    
    public func setAccessToken(accessToken: String){
        coreUtils.udpateOrInsertNewValue(forKey: accessTokenKey, value: accessToken)
    }
    
    public func getAccessToken() -> String{
        if let act = coreUtils.getValue(forKey: accessTokenKey) as? String{
            return act
        }
        return ""
    }
    
    public func saveAllInterestsList(interests: [Interest]){
        //[Interests] --> data --> String form
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(interests)
            if let jsonString = String(data: data, encoding: .utf8){
                coreUtils.udpateOrInsertNewValue(forKey: allInterestsKey, value: jsonString)
            }
        }catch{
            print("eror while encoding interests")
        }
    }
    
    public func getAllInterestsList() -> [Interest]?{
        if let jsonString = coreUtils.getValue(forKey: allInterestsKey) as? String{
            //JSON String --> Data --> [Interest]
            let decoder = JSONDecoder()
            do{
                if let data = jsonString.data(using: .utf8){
                    let allInterests = try decoder.decode([Interest].self, from: data)
                    return allInterests
                }
            }catch{
                print("error while decoding interests list")
            }
        }
        return nil
    }
    
    public func saveUserJson(user: User){
        // User Object --> Data --> JSON String
        let jsonEncoder = JSONEncoder()
        do{
            let data = try jsonEncoder.encode(user)
            let jsonString = String(data: data, encoding: .utf8)
            coreUtils.udpateOrInsertNewValue(forKey: userJsonKey, value: jsonString!)
        }catch{
            print("error while encoding to user json")
        }
    }
    
    public func getUser() -> User?{
        if let userJsonString = coreUtils.getValue(forKey: userJsonKey) as? String{
            //userJsonString --> Data --> User Object
            let decoder = JSONDecoder()
            do{
                if let data = userJsonString.data(using: .utf8){
                    let userObject = try decoder.decode(User.self, from: data)
                    return userObject
                }
            }catch{
                print("error while encoding to user json")
            }
        }
        return nil
    }
    
    public func clearData(){
        coreUtils.deleteRow()
    }
    
    public func setUsername(username: String){
        coreUtils.udpateOrInsertNewValue(forKey: usernameKey, value: username)
    }
    
    public func getUsername() -> String{
        if let username = coreUtils.getValue(forKey: usernameKey) as? String{
            return username
        }
        return ""
    }
    
    public func setLoggedIn(status: Bool){
        coreUtils.udpateOrInsertNewValue(forKey: isLoggedInKey, value: status)
    }
    
    public func getLoggedIn() -> Bool{
        if let value = coreUtils.getValue(forKey: isLoggedInKey){
            if let loggedIn = value as? Bool{
                return loggedIn
            }
        }
        return false
        
    }
}
