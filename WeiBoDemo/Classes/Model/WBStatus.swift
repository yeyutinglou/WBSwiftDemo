//
//  WBStatus.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/11/10.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit
import YYModel
class WBStatus: NSObject {
    
    var id: Int64 = 0
    
    var text: String?
    
    var forwardCount: Int = 0
    
    var commentCount: Int = 0
    
    var praiseCount: Int = 0
    
    var user: WBUser?
    
    var pics: [WBStatusPicture]? = []
    
    override var description: String {
        return yy_modelDescription()
    }
    
    
    class func modelContainerPropertyGenericClass() -> [String: AnyClass] {
        return ["thumb_urls" : WBStatusPicture.self]
    }

}
