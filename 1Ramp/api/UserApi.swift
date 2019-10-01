//
//  UserApi.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import Alamofire
import UIKit

extension ApiRequests{
    
    public func updateUserInterests(interest:[Int] ,completion: @escaping (_ updatedUser: User?) -> ()){
        let parameter: [String: AnyObject] = [
            "communities" : interest as AnyObject
        ]
        
        let header = headers()
        print("Header \(header)")
        let updateUrl = Endpoints.Users.updateUserInterest
        Alamofire.request(updateUrl, method: .put, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseData { (responseData) in
            if responseData.error != nil{
                completion(nil)
                print("Error while updating interests \(String(describing: responseData.error))")
                return
            }
            
            if let data = responseData.data{
                let decoder = JSONDecoder()
                do{
                    let user = try decoder.decode(User.self, from: data)
                    completion(user)
                }catch let execption{
                    completion(nil)
                    print("Exception \(execption)")
                }
            }
            
        }
    }
    
    public func fetchAllInterests(completition: @escaping (_ interets: [Interest]?)->()){
        let urlString = Endpoints.Communitites.communities
        Alamofire.request(urlString).responseData { (responseData) in
            if responseData.error != nil{
                completition(nil)
                return
            }
            let decoder = JSONDecoder()
            do{
                let interests = try decoder.decode([Interest].self, from: responseData.data!)
                completition(interests)
            }catch{
                completition(nil)
                print("error while decoding interests")
            }
        }
    }
    
    /*
     Pass Steemconnect Access Token and obtain User token from app server
     */
    public func requestUserToken(completition: @escaping (_ token: String? ,_ error: String?) -> Void){
        let urlString = Endpoints.Auth.login
        let acccessToken = LocalData.sharedInstance.getAccessToken()
        let username = LocalData.sharedInstance.getUsername()
        let body : [String:AnyObject] = ["username": username as AnyObject,
                                         "access_token" : acccessToken as AnyObject]
        
        Alamofire.request(urlString, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseJSON { (jsonResponse) in
            if jsonResponse.error != nil{
                completition(nil,"Error response: \(jsonResponse.error!)")
                return
            }
            guard let json = jsonResponse.result.value as? [String:Any] , let token = json["token"] else{
                completition(nil,"Invalid response: \(String(describing: jsonResponse.result.value))")
                return
            }
            completition(token as? String, nil)
        }
    }
    
    /*
     Fetches user data of given username
     */
    public func requestUserData(username: String, completition: @escaping (_ user: User?) -> ()){
        let urlString = Endpoints.Users.userByUsername(username)
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (dataResponse) in
            guard let data = dataResponse.data else {
                completition(nil)
                return
            }
            do{
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                completition(user)
            }catch let decodeException{
                print("decode exception \(decodeException)")
                completition(nil)
            }
        }
    }
}
