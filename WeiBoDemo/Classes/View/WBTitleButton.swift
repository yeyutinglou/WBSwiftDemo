//
//  WBTitleButton.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/6.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBTitleButton: UIButton {

    init(title: String?) {
        super.init(frame: CGRect())
        if title == nil {
            setTitle("首页", for: .normal)
        } else {
            setTitle(title! + " ", for: .normal)
            setImage(UIImage(named: "up"), for: .normal)
            setImage(UIImage(named: "down"), for: .selected)
        }
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        setTitleColor(.darkGray, for: .normal)
        
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = titleLabel, let imageView = imageView, titleLabel.frame.origin.x != 0 else {
            return
        }
        print("\(titleLabel)\(imageView)")
        titleLabel.frame = titleLabel.frame.offsetBy(dx: -imageView.bounds.width, dy: 0)
        imageView.frame = imageView.frame.offsetBy(dx: titleLabel.bounds.width + 1, dy: 0)
    }
    
}
