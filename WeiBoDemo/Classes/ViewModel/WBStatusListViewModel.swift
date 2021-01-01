
//
//  WBStatusListViewModel.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/11/10.
//  Copyright © 2020 dyw. All rights reserved.
//

import Foundation

class WBStatusListViewModel {
    lazy var statusList = [WBStatusViewModel]()
    static var pageNum: Int64 = 1
    
    func loadStatus(pullup: Bool, completion: @escaping (_ isSuccess: Bool) ->()) {
        
        var num = WBStatusListViewModel.pageNum
        if pullup {
            num += 1
        }
        NetworkManager.shared.statusList(pageSize: 10, pageNum: num) { (list, isSuccess) in
            
            var arr = [WBStatusViewModel]()
            
            for dic in list ?? [] {
                guard let model = WBStatus.yy_model(with: dic) else {
                    continue
                }
                arr.append(WBStatusViewModel(model: model))
            }
            
            if pullup {
                self.statusList += arr
            } else {
                self.statusList = arr + self.statusList
            }
            
            completion(isSuccess)
        }
    }
}
