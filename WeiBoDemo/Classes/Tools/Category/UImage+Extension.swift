//
//  UImage+Extension.swift
//  WeiBoDemo
//
//  Created by dyw on 2020/12/6.
//  Copyright © 2020 dyw. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 重绘图片
    /// - Parameters:
    ///   - size: 新的尺寸
    ///   - backColor: 背景颜色
    ///   - borderColor: 边框颜色
    ///   - borderWith: 边框宽度
    /// - Returns: UIImage
    func dyw_redrawImage(size: CGSize?, backColor: UIColor = .white, borderColor: UIColor = .darkGray, borderWith: CGFloat = 2) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        
        let rect = CGRect(origin: CGPoint.zero, size: size!)
        /*
          图像上下文
         size: 绘制尺寸
         opaque: false/透明  true/不透明
         scale: 屏幕分辨率 0当前设备分辨率
         */
        UIGraphicsBeginImageContextWithOptions(size!, true, 0)
        //背景填充
        backColor.setFill()
        UIRectFill(rect)
        //路径裁剪
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        //绘制
        draw(in: rect)
        //绘制内切圆形
        borderColor.setStroke()
        path.lineWidth = borderWith
        path.stroke()
        
        
        //结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        return result
    }
}
