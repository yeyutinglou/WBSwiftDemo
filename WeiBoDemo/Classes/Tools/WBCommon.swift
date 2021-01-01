//
//  WBCommon.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/4.
//  Copyright © 2020 dyw. All rights reserved.
//

import Foundation
import UIKit
// MARK: - 全局通知定义

/// 登录通知
let WBUserShouldLoginNotification = "WBUserShouldLoginNotification"


// MARK: - 图片尺寸定义

let WBStatusPicViewOutterMargin: CGFloat = 12
let WBStatusPicViewInnerMargin: CGFloat = 5
let WBStatusPicViewWidth = UIScreen.screenWidth - 2 * WBStatusPicViewOutterMargin
let WBStatusPicItemWidth = (WBStatusPicViewWidth - 2 * WBStatusPicViewInnerMargin) / 3

