//
//  WBStatusViewModel.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBStatusViewModel {
    
    var status: WBStatus?
    
    var memberIcon: UIImage?
    
    var vipIcon: UIImage?
    
    var forward: String?
    
    var comment: String?
    
    var praise: String?
    
    var picViewSize: CGSize?
    
    init(model: WBStatus) {
        self.status = model
        
        forward = countString(model.forwardCount, "转发")
        comment = countString(model.commentCount, "评论")
        praise = countString(model.praiseCount, "赞")
        picViewSize = calcPicViewSize(model.pics?.count)
        
    }

}

extension WBStatusViewModel {
    private func countString(_ count: Int, _ defaultStr: String) -> String {
        if count == 0 {
            return defaultStr
        } else if count < 10000 {
            return String(count)
        } else {
            return String(format: "%.02f 万", Double(count) / 10000)
        }
    }
    
    
    private func calcPicViewSize(_ count: Int?) -> CGSize {
        if count == 0 || count == nil {
            return CGSize()
        }
        
        let row = (count! - 1) / 3 + 1
        
        var height = WBStatusPicViewOutterMargin
        height += CGFloat(row) * WBStatusPicItemWidth
        height += CGFloat(row - 1) * WBStatusPicViewInnerMargin
        
        
        
        return CGSize(width: WBStatusPicViewWidth, height: height)
    }
}
