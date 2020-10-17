//
//  WBCustomNavigationBar.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/17.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBCustomNavigationBar: UINavigationBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        for subView in self.subviews {
            let string = NSStringFromClass(subView.classForCoder)
            if string.contains("BarBackground") {
                subView.frame = self.bounds
            } else if string.contains("UINavigationBarContentView") {
                subView.y = UIScreen.statusBarHeight
            }
        }
    }

}
