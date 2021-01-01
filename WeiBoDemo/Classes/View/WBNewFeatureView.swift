//
//  WBNewFeatureView.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/6.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

let count = 4

class WBNewFeatureView: UIView {

    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false;
        scrollView.delegate = self
        return scrollView
    }()
    class func newFeatureView() -> WBNewFeatureView {
        let v = Bundle.main.loadNibNamed(String(describing: WBNewFeatureView.self), owner: nil, options: nil)?[0]
        return v as! WBNewFeatureView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.insertSubview(scrollView, at: 0)
        enterBtn.isHidden = true
        
        
        let rect = UIScreen.main.bounds
        for i in 0..<count {
            let imageName = "name\(i+1)"
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.backgroundColor = UIColor.randomColor
            imageView.frame = rect.offsetBy(dx: CGFloat(i) * rect.width, dy: 0)
            scrollView.addSubview(imageView)
            
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(count + 1) * rect.width, height: rect.height)
    }
    

    @IBAction func enterClick(_ sender: UIButton) {
        removeFromSuperview()
    }
   
}


extension WBNewFeatureView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        print(page)
        if page == scrollView.subviews.count {
            removeFromSuperview()
        }
        enterBtn.isHidden = (page != scrollView.subviews.count - 1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        enterBtn.isHidden = true
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width + 0.5)
        pageControl.currentPage = page
        
        pageControl.isHidden = (page == scrollView.subviews.count)
    }
}
