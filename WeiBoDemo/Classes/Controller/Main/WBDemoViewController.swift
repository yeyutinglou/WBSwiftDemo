//
//  WBDemoViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/17.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第\(navigationController?.children.count ?? 0)个"
    }
    

}

// MARK: - Method
extension WBDemoViewController {
    @objc private func showNext() {
        navigationController?.pushViewController(WBDemoViewController(), animated: true)
    }
}


// MARK: - UI
extension WBDemoViewController {
    
    override func setupTableView() {
        super.setupTableView()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))

    }
    
}
