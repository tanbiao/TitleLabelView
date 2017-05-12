//
//  TitleLabelView.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class TitleLabelView: UIView
{
    fileprivate var  titles : [String]
    fileprivate var  style : LabelStyle
    fileprivate lazy var collectionView : UICollectionView =
        {
          let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
          collectionView.dataSource = self
          return collectionView
    }()
    
    fileprivate lazy var layout : LabelLayout =
        {
          let layout = LabelLayout()
          layout.delegate = self
            
          return layout
    }()
    
    init(frame: CGRect,titles : [String], style : LabelStyle) {
        self.titles = titles
        self.style = style
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TitleLabelView
{
    func setupInit()
    {
        addSubview(collectionView)
    }

}

extension TitleLabelView : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}

extension TitleLabelView : LabelLayoutDategate
{
    
    func labelLayout(_ layout: LabelLayout, widthForRowsAt indexPath: IndexPath) -> (currentWidth: CGFloat, nextWidth: CGFloat) {
       
        return (30,40)
    }
    
    func labelLayout(_ layout: LabelLayout, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 10
    }
    
}
