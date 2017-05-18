//
//  TextAlertView.swift
//  TitleLabelView
//
//  Created by 西乡流水 on 17/5/16.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit
import VideoToolbox

class TextAlertView: UIView
{
    fileprivate var text : String
    
    fileprivate lazy var contentView : UIScrollView = {
        let contentView = UIScrollView(frame: self.bounds)
        return contentView
    }()
    
    fileprivate lazy var textLabel : UILabel = {
    
        let textLabel = UILabel(frame: self.contentView.bounds)
        return textLabel
    }()
    
    init(text : String,textFont : UIFont,point: CGPoint)
    {
        self.text = text
        let frame = CGRect.zero
        super.init(frame: frame)
        
        let size = String.size(text: text, textFont: textFont)
        self.frame.size = CGSize(width: size.width + 2, height: size.height + 2)
        
        self.center.x = point.x
        self.center.y = point.y + size.height + 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextAlertView
{
    func setUpInit()
    {
        addSubview(contentView)
        contentView.addSubview(textLabel)
    }
    
}
