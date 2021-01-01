//
//  WBVisitorView.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/17.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var iconImage: UIImageView = UIImageView()
    
    var visitorInfo: [String : String]? {
        didSet {
            guard let title = visitorInfo?["title"],
                let icon = visitorInfo?["icon"] else {
                    return
            }
            titleLabel.text = title
            iconImage.image = UIImage(named: "tabbar_" + icon)
            if title == "首页" {
                startAnimation()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi * 2
        animation.repeatCount = MAXFLOAT
        animation.duration = 5
        animation.isRemovedOnCompletion = false
        iconImage.layer.add(animation, forKey: nil)
    }
    
}

// MARK: - UI
extension WBVisitorView {
    private func setupUI() {
        backgroundColor = .white
        titleLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 40);
        addSubview(titleLabel);
        
        iconImage.frame = CGRect(x: 100, y: 140, width: 40, height: 40);
        addSubview(iconImage);
    }
}
