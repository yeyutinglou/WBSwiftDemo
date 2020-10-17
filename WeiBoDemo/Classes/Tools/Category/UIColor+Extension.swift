//
//  UIColor+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var randomColor: UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(255)) / 255, green: CGFloat(arc4random_uniform(255)) / 255, blue: CGFloat(arc4random_uniform(255)) / 255, alpha: 1.0)
    }
}
