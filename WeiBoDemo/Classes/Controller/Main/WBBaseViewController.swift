//
//  WBBaseViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    
    /// 自定义navBar
    lazy var navBar = WBCustomNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWith, height: UIScreen.navBarAndStatusBarHeight))
    
    /// 自定义navItem
    lazy var navItem = UINavigationItem()
    
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    /// 加载数据（子类实现）
    func loadData() {
        
    }

    
}



// MARK: - UI
extension WBBaseViewController {
    
    
   @objc func setupUI() {
    
    view.backgroundColor = UIColor.randomColor
    
    setupNavigationBar()
    setupTableView()
    
    }
    
    
    /// 设置表格视图
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navBar)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    /// 设置导航栏
    private func setupNavigationBar() {
        view.addSubview(navBar)
        navBar.barTintColor = .white
        navBar.titleTextAttributes = [.foregroundColor : UIColor.darkGray]

        navBar.items = [navItem]
    }
    
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WBBaseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
