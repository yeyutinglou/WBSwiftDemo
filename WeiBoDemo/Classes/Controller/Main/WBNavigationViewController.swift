//
//  WBNavigationViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBNavigationViewController: UINavigationController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? WBBaseViewController {
                var title = "返回"
                if children.count == 1 {
                    title = children.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(pop), isBack: true)
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    @objc private func pop() {
        self.popViewController(animated: true)
    }


}

