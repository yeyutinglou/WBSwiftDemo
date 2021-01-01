//
//  WBLoginViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/4.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation()
        view.backgroundColor = .white
    }
    

}
// MARK: - UI
extension WBLoginViewController {
    private func setupNavigation() {
        title = "登录"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", target: self, action: #selector(close), isBack: true)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
