//
//  Bundle+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/16.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension Bundle {
    var spaceName: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
