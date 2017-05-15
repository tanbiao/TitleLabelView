//
//  LabelStyle.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

struct LabelStyle
{
    //labelView内间距
    let labelViewInsert = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    /**item之间的水平间距*/
    let itemMargin : CGFloat = 5
    
    /// item之间的上下间距
    let lineMargin : CGFloat = 5
   
    /// labelView的背景颜色
    let labelViewBackGroundColor : UIColor = UIColor.cyan
    
    /// item的文字颜色
    let textColor : UIColor = UIColor.gray
    
    /// item的背景颜色
    let itemBackGroundColor : UIColor = UIColor.green
    
    /// item的圆角半径
    let itemCornerRadius : CGFloat = 5
    
    /// item的文字字体
    let textFont :UIFont = UIFont.systemFont(ofSize: 12)
    
}
