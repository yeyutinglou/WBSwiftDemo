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

    lazy var addBtn = UIButton(imageName: "add", backgroundImageName: "add")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewControllers()
        setupAddButton()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    

}

// MARK: - Method
extension WBMainViewController {
    @objc private func addBtnAction() {
        
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
        let array = [
            ["clsName": "WBHomeViewController", "title": "首页", "imageName": "home"],
            ["clsName": "WBMessageViewController", "title": "消息", "imageName": "message"],
            ["clsName": "UIViewController"],
            ["clsName": "WBDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["clsName": "WBProfileViewController", "title": "我的", "imageName": "profile"]
        ]
        var vcArr = [UIViewController]()
        for dic in array {
            let vc = controller(dict: dic)
            vcArr.append(vc)
        }
        viewControllers = vcArr
        
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        guard let clsName = dict["clsName"],
        let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString((Bundle.main.spaceName) + "." + clsName) as? UIViewController.Type
         else {
                return UIViewController()
        }
        let vc = cls.init()
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.darkText], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        let nav = WBNavigationViewController(rootViewController: vc)
        return nav
    }
}
