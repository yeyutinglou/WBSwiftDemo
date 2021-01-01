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
    private lazy var listViewModel = WBStatusListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupNavigationBar()

    }
    
    override func loadData() {
        
        listViewModel.loadStatus(pullup: self.isPullup) { (isSuccess) in
             self.refreshControl?.endRefreshing()
           self.isPullup = false
           self.tableView?.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            for i in 0..<20 {
                let model = WBStatus()
                let user = WBUser()
                user.userName = "测试\(i)"
                let content = "测试稍等发送到发送到发精灵盛典看风景阿斯利康打飞机按时来得快房间爱啥代理费看见爱上大路口附近阿萨德来看风景的发生率肯德基发了啥快递费就爱上了的看法静安寺的路口附近阿萨德来看风景as两地分居富士康的房间爱丽丝的咖啡机爱丽丝的开发将按时来得快房间按时来得快罚款睡了多久发了啥快递费结案率收到扣分静安寺路口的房间啊"
                model.text = String(content[content.startIndex..<content.index(content.startIndex, offsetBy: Int(arc4random_uniform(UInt32(content.count))))])
                model.forwardCount = Int(arc4random_uniform(10))
                model.commentCount = Int(arc4random_uniform(10000))
                model.praiseCount = Int(arc4random_uniform(20000))
                var arr = [WBStatusPicture]()
                for _ in 0..<9 {
                    arr.append(WBStatusPicture())
                }
                let pics = arr[0...Int(arc4random_uniform(8))]
                model.pics? = Array(pics)
                model.user = user
                let viewModel = WBStatusViewModel(model: model)
                self.listViewModel.statusList.append(viewModel)
                
            }
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            self.tableView?.reloadData()
        }
        
    }

    
   
}

// MARK: - 数据源方法实现
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WBStatusCell
//        cell.textLabel?.text = listViewModel.statusList[indexPath.row].text
        cell.viewModel = listViewModel.statusList[indexPath.row]
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
    
    override func setupTableView() {
        super.setupTableView()
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        tableView?.register(UINib(nibName: "WBStatusNormalCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 300
        tableView?.separatorStyle = .none
    }
    
    private func setupNavigationBar() {
        let btn = WBTitleButton(title: "夜雨听楼")
        btn.addTarget(self, action: #selector(titleViewSeleted(_:)), for: .touchUpInside)
        navItem.titleView = btn
    }
    
    @objc func titleViewSeleted(_ btn: UIButton) {
        btn.isSelected = !btn.isSelected
    }
}
