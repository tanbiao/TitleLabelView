//
//  TitleLabelViewCell.swift
//  TitleLabelView
//
//  Created by 西乡流水 on 17/5/15.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class TitleLabelViewCell: UICollectionViewCell,Reusable {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var cornerRadius : CGFloat = 0
    
    static var nib : UINib?
        {
       return UINib(nibName: "TitleLabelViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.titleLabel.layer.cornerRadius = cornerRadius
        self.titleLabel.layer.masksToBounds = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
        self.addGestureRecognizer(longPress)

    }
    
    func longPress(gesture : UILongPressGestureRecognizer)
    {
        print("我长按了.....")
    }
   

}
