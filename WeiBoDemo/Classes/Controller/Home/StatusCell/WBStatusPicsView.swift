//
//  WBStatusPicsView.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBStatusPicsView: UIView {

    @IBOutlet weak var heightCon: NSLayoutConstraint!
    
    var pics: [WBStatusPicture]? {
        didSet {
            
            for iv in subviews {
                iv.isHidden = true
            }
            
            var index = 0
            for pic in pics ?? [] {
                let iv = subviews[index] as! UIImageView
                iv.isHidden = false
                iv.dyw_setImage(urlStr: pic.thumb_url, placeholderImage: nil)
                //四张图处理
                if index == 1 && pics?.count == 4 {
                    index += 1
                }
                
                index += 1
            }
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

}


extension WBStatusPicsView {
    private func setupUI() {
        backgroundColor = superview?.backgroundColor
        let rect = CGRect(x: 0, y: WBStatusPicViewOutterMargin, width: WBStatusPicItemWidth, height: WBStatusPicItemWidth)
        let count = 3
        for i in 0..<count * count {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.frame = rect
            let row = CGFloat(i / count)
            let col = CGFloat(i % count)
            let xOffset = col * (WBStatusPicItemWidth + WBStatusPicViewInnerMargin)
            let yOffset = row * (WBStatusPicItemWidth + WBStatusPicViewInnerMargin)
            iv.frame = rect.offsetBy(dx: xOffset, dy: yOffset)
    
            iv.backgroundColor = .red
           
            addSubview(iv)
        }
    }
}
