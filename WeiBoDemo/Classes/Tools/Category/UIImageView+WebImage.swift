//
//  UIImageView+WebImage.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/7.
//  Copyright © 2020 dyw. All rights reserved.
//

import SDWebImage


extension UIImageView {
    func dyw_setImage(urlStr: String?, placeholderImage: UIImage?) {
        guard let urlStr = urlStr,
            let url = URL(string: urlStr) else {
            image = placeholderImage
            return
        }
        
        sd_setImage(with: url, placeholderImage: image, options: []) { (image, _, _, _) in
            
        }
    }
}
