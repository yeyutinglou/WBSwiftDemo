//
//  NetworkManager.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/18.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit
import AFNetworking

enum HTTPMethod {
    case GET
    case POST
}

class NetworkManager: AFHTTPSessionManager {
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
    }()
    
    lazy var userAccount = WBUserAccount()
    
    
    /// 是否登录
    var userLogin: Bool {
        return userAccount.access_token != nil
    }
    
    func tokenRequest(method: HTTPMethod = .GET, urlStr: String, paramters: [String: Any]?, completion: @escaping(_ json: Any?, _ isSuccess: Bool) -> ()) {
        guard let token = userAccount.access_token else {
            completion(nil, false)
            //token不存在 需要重新登录
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
            return
        }
        var paramters = paramters
        if paramters == nil {
            paramters = [String: Any]()
        }
        paramters!["accessToken"] = token
        request(urlStr: urlStr, paramters: paramters, completion: completion)
    }
    
    func request(method: HTTPMethod = .GET, urlStr: String, paramters: [String: Any]?, completion: @escaping(_ json: Any?, _ isSuccess: Bool) -> ()) {
        
        let success = { (task: URLSessionDataTask, json: Any?) ->() in
            completion(json, true)
        }
        let failure = { (task: URLSessionDataTask?, error: Error) -> () in
            print(error)
            completion(nil, false)
        }
        
        if method == .GET {
            get(urlStr, parameters: paramters, headers: nil, progress: nil, success: success, failure: failure)
        } else {
            post(urlStr, parameters: paramters, headers: nil, progress: nil, success: success, failure: failure)
        }
        
    }
}
