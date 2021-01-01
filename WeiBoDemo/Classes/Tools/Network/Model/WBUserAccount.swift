
//
//  WBUserAccount.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/5.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

private let accountFile = "useraccount.json"

class WBUserAccount: NSObject {
    
    var access_token: String? = "sada"
    var uid: String?
    var expires_in: TimeInterval = 0 {
        didSet {
            expireDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    var expireDate: Date?
    
    override var description: String {
        return yy_modelDescription()
    }
    
    override init() {
        super.init()
        guard let data = NSData(contentsOfFile: self.getFilePath()),
        let dic = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any] else {
            return
        }
        yy_modelSet(with: dic)
        
        if expireDate?.compare(Date()) != ComparisonResult.orderedDescending {
            access_token = nil
            uid = nil
            try? FileManager.default.removeItem(atPath: self.getFilePath())
        }
        
    }
    
    /*
     1.偏好设置
     2.沙盒 归档/plist/json
     3.数据库-（FMDB/CoreData)
     4.钥匙串
     */
    
    func saveAccount() {
        var dic = self.yy_modelToJSONObject() as? [String: Any] ?? [:]
        if dic.keys.contains("expires_in") {
            dic.removeValue(forKey: "expires_in")
        }
        guard let data = try? JSONSerialization.data(withJSONObject: dic, options: []) else {
            return
        }
        
        
        (data as NSData).write(toFile: self.getFilePath(), atomically: true)
    
    }
    
    private func getFilePath() -> String {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = (docPath as NSString).appendingPathComponent(accountFile)
        return filePath
    }

}
