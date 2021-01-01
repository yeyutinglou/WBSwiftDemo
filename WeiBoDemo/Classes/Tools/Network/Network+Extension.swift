//
//  Network+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/18.
//  Copyright © 2020 dyw. All rights reserved.
//

import Foundation

extension NetworkManager {
    
    func statusList(pageSize: Int64 = 0, pageNum: Int64 = 0,  completion: @escaping(_ list: [[String: Any]]?, _ isSuccess: Bool) -> ()) {
        let urlStr = "https://api.weibo.com/2/statuses/home_timeline.json"
        var parmas = ["pageSize": pageSize]
        parmas["pageNum"] = pageNum
        
        tokenRequest(urlStr: urlStr, paramters: parmas) { (json, isSuccess) in
            let result = (json as? [String: Any])?["statuses"] as? [[String: Any]]
            completion(result, isSuccess)
        }
        
        
    }
    
    
    func unreadCount(completion: @escaping(_ count: Int)->()) {
        let count = 2
        completion(count)
    }
    
    func loadAccessToken(code: String) {
        let urlStr = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        request(method: .POST, urlStr: urlStr, paramters: nil) { (json, isSuccess) in
            self.userAccount.yy_modelSet(with: (json as? [AnyHashable : Any]) ?? [:])
            self.userAccount.saveAccount()
        }
    }
}
