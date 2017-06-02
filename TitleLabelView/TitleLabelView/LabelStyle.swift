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
    var labelViewInsert = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)

    /**item之间的水平间距*/
    var itemMargin : CGFloat = 5
    
    /// item之间的上下间距
    var lineMargin : CGFloat = 20
   
    /// labelView的背景颜色
    var labelViewBackGroundColor : UIColor = UIColor.white
    
    /// item的文字颜色
    var textColor : UIColor = UIColor.gray
    
    /// item的背景颜色
    var itemBackGroundColor : UIColor = UIColor.green
    
    /// item的圆角半径
    var itemCornerRadius : CGFloat = 5
    
    /// item的文字字体
    var textFont :UIFont = UIFont.systemFont(ofSize: 14)
    
    /// 是否可以滚动
    var LabelViewIsScroll : Bool = true
    
    /// 在选择item的时候是否删除当前item,false : 表示
    var selectItemIsDelete : Bool = true
    
}
