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
    
    @IBOutlet weak var closeBtn: UIButton!
    
    var cornerRadius : CGFloat = 0.0
        {
          didSet
          {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            layer.borderColor = UIColor.gray.cgColor
            layer.borderWidth = 1
          }
    }
    
    static var nib : UINib?
        {
       return UINib(nibName: "TitleLabelViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
    @IBAction func closeBtn(_ sender: Any)
    {
     
    }
    
}

/*UITapGestureDelegate*/
extension TitleLabelViewCell : UIGestureRecognizerDelegate
{
    

}
