//
//  WBStatusToolView.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBStatusToolView: UIView {
    
    var viewModel: WBStatusViewModel? {
        didSet {
            forwardButton.setTitle(viewModel?.forward, for: .normal)
            commentButton.setTitle(viewModel?.comment, for: .normal)
            praiseButton.setTitle(viewModel?.praise, for: .normal)
        }
    }

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var praiseButton: UIButton!

}
