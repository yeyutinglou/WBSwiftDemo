//
//  UIScreen+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/10/17.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension UIScreen {
    
    
    class var screenWith: CGFloat {
        return main.bounds.width
    }
    
    class var screenHeight: CGFloat {
        return main.bounds.height
    }
    
    class var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    class var isIphoneX: Bool {
        return screenWith >= 375.0 && screenHeight >= 812.0  && isIphone
    }
    
    class var statusBarHeight: CGFloat {
        return isIphoneX ? 44.0 : 20.0
    }
    
    class var navBarHeight: CGFloat {
        return 44.0
    }
    
    class var navBarAndStatusBarHeight: CGFloat {
        return statusBarHeight + navBarHeight
    }
    
    class var bottomSafeHeight: CGFloat {
        return isIphoneX ? 34.0 :0
    }
    
    class var tabBarHeight: CGFloat {
        return bottomSafeHeight + 49.0
    }

}
