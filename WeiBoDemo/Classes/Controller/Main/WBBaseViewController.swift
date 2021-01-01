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
    lazy var navBar = WBCustomNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.navBarAndStatusBarHeight))
    
    /// 自定义navItem
    lazy var navItem = UINavigationItem()
    
    var tableView: UITableView?
    
    var refreshControl: UIRefreshControl?
    
    var isPullup = false
    
    
    /// 未登录界面
    var visitorInfo: [String: String]?
    
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
    @objc func loadData() {
        refreshControl?.endRefreshing()
    }

    
    @objc func register() {
        
    }
    
    @objc func login() {
        NotificationCenter.default.post(name: Notification.Name.init(WBUserShouldLoginNotification), object: nil)
    }
    
}



// MARK: - UI
extension WBBaseViewController {
    
    
   private func setupUI() {
    
    view.backgroundColor = UIColor.white
    
    setupNavigationBar()
    
    NetworkManager.shared.userLogin ? setupTableView() : setupVisitorView()
    
    
    }
    
    
    /// 设置表格视图
     @objc func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navBar)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.contentInset = UIEdgeInsets(top: UIScreen.navBarAndStatusBarHeight, left: 0, bottom: UIScreen.tabBarHeight, right: 0)
        tableView?.contentInsetAdjustmentBehavior = .never
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    
    /// 访客视图
    private func setupVisitorView() {
        let visitorView = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navBar)
        visitorView.visitorInfo = visitorInfo
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", target: self, action: #selector(register))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登录", target: self, action: #selector(login))
    }
    
    /// 设置导航栏
    private func setupNavigationBar() {
        view.addSubview(navBar)
        navBar.barTintColor = .white
        navBar.titleTextAttributes = [.foregroundColor : UIColor.darkGray]
        navBar.tintColor = .orange
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        let count = tableView.numberOfRows(inSection: section)
        if row == count - 1 && !isPullup {
            isPullup = true
            
            loadData()
        }
    }
}
