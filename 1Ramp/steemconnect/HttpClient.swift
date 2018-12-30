//
//  HttpClient.swift
//  SwiftySteem
//
//  Created by Benedikt Veith on 20.02.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import Foundation

class HttpClient {
    
    
    /// Steem API Variable
    var api : String!
    
    
    /// Init
    ///
    /// - Parameter api: The steem API URL; Defaults to: 'https://api.steemit.com'
    init(api: String) {
       self.api = api
    }
    
    
    /// Fetch Data using a GET Request
    ///
    /// - Parameters:
    ///   - url: Specified source (e.g API URL)
    ///   - completion: Completion Block; Returns error and response objects
    func getData(url: String, completion:((Any?, _ response: Any?) -> Void)?) {
        let urlCom = URLComponents(string: url)?.url
        
        var request = URLRequest(url: urlCom!)
        request.httpMethod = "GET"
        
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(responseError!, nil)
                return
            }
            
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                let jsonResult = utf8Representation.toJSON()!

                if let result = jsonResult as? [String: Any] {
                    if let error = result["error"] {
                        completion?(error, nil);
                        return;
                    }
                    
                    completion?(nil, result);
                    return
                }
                
                if let result = jsonResult as? [Any] {
                    completion?(nil, result[0]);
                    return
                }

            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
    }
    
    
    /// Fetch Data using POST requests. Is used to fetch data from the condenser / steem API.
    /// The URL is specified during initialisation
    ///
    /// - Parameters:
    ///   - jsonData: Post Body Data
    ///   - completion: Completion Block; Returns error and response objects
    func useEndpoint(jsonData: Data, completion:((Any?, _ response: Any?) -> Void)?) {
        let url = URLComponents(string: api)?.url

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers

        request.httpBody = jsonData

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(responseError!, nil)
                return
            }

            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                
                let result = utf8Representation.toJSON()! as! NSDictionary
                
                if let error = result["error"] {
                    completion?(error, nil);
                    return;
                }
                
                completion?(nil, result);
            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
    }
}




