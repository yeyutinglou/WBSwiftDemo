//
//  WBMainViewController.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit
import Foundation

class WBMainViewController: UITabBarController {
    private var timer: Timer?
    lazy var addBtn = UIButton(imageName: "add", backgroundImageName: "add")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewControllers()
        setupAddButton()
        setupTimer()
        
        setupNewFeatureViews()
        
        delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(userLogin(n:)), name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
    }
    
    deinit {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - 监听通知
    @objc private func userLogin(n: Notification) {
        let na = UINavigationController(rootViewController: WBLoginViewController())
        present(na, animated: true, completion: nil)
    }
    

}
// MARK: - delegate
extension WBMainViewController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print(viewController)
        if let index = children.firstIndex(of: viewController) {
            if index == 0 && index == tabBarController.selectedIndex {
                //获取首页  刷新数据
                let vc = children[0].children[0] as! WBHomeViewController
                vc.tableView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                vc.loadData()
                vc.tabBarItem.badgeValue = nil
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
        return !viewController.isMember(of: UIViewController.self)
    }
}


// MARK: - Timer
extension WBMainViewController {
    private func setupTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            if !NetworkManager.shared.userLogin {
                return
            }
            NetworkManager.shared.unreadCount { (count) in
                self.tabBar.items?[0].badgeValue = count > 0 ? "\(count)" : nil
                
                UIApplication.shared.applicationIconBadgeNumber = count
            }
           }
    }
}

// MARK: - Method
extension WBMainViewController {
    @objc private func addBtnAction() {
        
    }
}
// MARK: - 新特性视图
extension WBMainViewController {
    private func setupNewFeatureViews() {
        
        if !NetworkManager.shared.userLogin {
            return
        }
        
        let v = isNewVersion ? WBNewFeatureView.newFeatureView() : WBWelcomeView.welcomeView()
        v.frame = view.bounds
        view.addSubview(v)
    }
    
    
    
    
    private var isNewVersion: Bool {
        let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let path = ("version" as NSString).appendDocumentDir()
        let sandboxVersion = (try? String(contentsOfFile: path)) ?? ""
        try? currentVersion.write(toFile: path, atomically: true, encoding: .utf8)
        //FIXME: -  判断新特性还是欢迎
        return sandboxVersion != currentVersion
    }
}


// MARK: - UI
extension WBMainViewController {
    
    private func setupAddButton() {
        tabBar.addSubview(addBtn)
        
        let count = children.count
        let w = tabBar.bounds.width / CGFloat(count)

        addBtn.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        addBtn.addTarget(self, action: #selector(addBtnAction), for: .touchUpInside)
        
    }
    
    
    private func setupViewControllers() {
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("demo.json")
        var data = NSData(contentsOfFile: jsonPath)
        if data == nil {
            let path = Bundle.main.path(forResource: "demo.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: Any]] else { return }
        
        
        var vcArr = [UIViewController]()
        for dic in array {
            let vc = controller(dict: dic)
            vcArr.append(vc)
        }
        viewControllers = vcArr
        
    }
    
    private func controller(dict: [String: Any]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString((Bundle.main.spaceName) + "." + clsName) as? UIViewController.Type,
            let visitorInfo = dict["visitorInfo"] as? [String: String]
         else {
                return UIViewController()
        }
        let vc = cls.init() as! WBBaseViewController
        vc.title = title
        vc.visitorInfo = visitorInfo
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.darkText], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        let nav = WBNavigationViewController(rootViewController: vc)
        return nav
    }
}
