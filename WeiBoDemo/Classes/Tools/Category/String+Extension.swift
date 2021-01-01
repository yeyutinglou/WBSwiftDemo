//
//  String+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/6.
//  Copyright © 2020 dyw. All rights reserved.
//

import Foundation

extension NSString {
    func appendDocumentDir() -> String {
        let doc = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return (doc as NSString).appendingPathComponent(self as String)
    }
}
