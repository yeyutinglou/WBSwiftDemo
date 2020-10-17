//
//  WBHomeViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {
    
    private lazy var statusList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    override func loadData() {
        for i in 0..<10 {
            statusList.insert(i.description, at: 0)
        }
    }

    
   
}

// MARK: - 数据源方法实现
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}

// MARK: - Method
extension WBHomeViewController {
    @objc private func showFriends() {
        let demo =  WBDemoViewController()
        navigationController?.pushViewController(demo, animated: true)
    }
}


// MARK: - UI
extension WBHomeViewController {
    override func setupUI() {
        super.setupUI()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
