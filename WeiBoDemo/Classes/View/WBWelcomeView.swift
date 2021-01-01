//
//  WBWelcomeView.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/6.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBWelcomeView: UIView {
    @IBOutlet weak var bottomCon: NSLayoutConstraint!
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    class func welcomeView() -> WBWelcomeView {
//        let nib = UINib(nibName: "WBWelcomeView", bundle: nil)
//        let v = nib.instantiate(withOwner: nil, options: nil)[0]
        let v = Bundle.main.loadNibNamed(String(describing: WBWelcomeView.self), owner: nil, options: nil)?[0]
        return v as! WBWelcomeView
    }
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = avatar.bounds.width * 0.5
    }
    
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        self.layoutIfNeeded()
        
        bottomCon.constant = bounds.size.height - 200
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.titleLabel.alpha = 1.0
            }) { (_) in
                self.removeFromSuperview()
            }
        }
    }
    
}
