//
//  UIButton+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(imageName: String, backgroundImageName: String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
//        setBackgroundImage(UIImage(named: backgroundImageName), for: .normal)
        frame = CGRect(origin: CGPoint(x: 0, y: 0), size: currentImage?.size ?? CGSize.zero)
    }
    
    
    /// 构造UIButton
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - fontSize: <#fontSize description#>
    ///   - normalColor: <#normalColor description#>
    ///   - highlightedColor: <#highlightedColor description#>
    ///   - target: <#target description#>
    ///   - action: <#action description#>
    ///   - event: <#event description#>
    convenience init(title: String?, fontSize: CGFloat = 16, normalColor: UIColor? = .darkGray, highlightedColor: UIColor? = .orange, target: Any?, action: Selector, event: UIControl.Event = .touchUpInside) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(normalColor, for: .normal)
        setTitleColor(highlightedColor, for: .highlighted)
        addTarget(target, action: action, for: event)
        sizeToFit()
    }
    
}
