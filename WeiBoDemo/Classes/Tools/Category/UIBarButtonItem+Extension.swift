//
//  UIBarButtonItem+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/17.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(title: String?, target: Any?, action: Selector, isBack: Bool = false) {
        let btn = UIButton(title: title, target: target, action: action)
        if isBack {
            let imageName = "navbar_back"
            btn.setImage(UIImage(named: imageName), for: .normal)
            btn.setImage(UIImage(named: imageName + "highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        self.init(customView: btn)
    }
}
