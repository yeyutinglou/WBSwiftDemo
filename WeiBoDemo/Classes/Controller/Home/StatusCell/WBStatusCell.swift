//
//  WBStatusCell.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBStatusCell: UITableViewCell {
    
    var viewModel: WBStatusViewModel? {
        didSet {
            userName.text = viewModel?.status?.user?.userName
            contentLabel.text = viewModel?.status?.text
            
            
            toolView.viewModel = viewModel
            
            picsView.heightCon.constant = viewModel?.picViewSize?.height ?? 0
            picsView.pics = viewModel?.status?.pics
        }
    }
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var status: UIImageView!
     @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var toolView: WBStatusToolView!
    
    @IBOutlet weak var picsView: WBStatusPicsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
