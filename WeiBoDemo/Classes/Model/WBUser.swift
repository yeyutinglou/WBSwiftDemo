//
//  WBUser.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBUser: NSObject {
    var uid: Int = 0
    var userName: String?
    var avatar: String?
    var verified_type: Int = 0
    
    var mbrank: Int = 0
    
    
    
    override var description: String {
        return yy_modelDescription()
    }
}
