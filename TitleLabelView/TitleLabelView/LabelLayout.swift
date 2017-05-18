
//
//  LabelLayout.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

protocol LabelLayoutDategate : class
{
    func labelLayout(_ layout: LabelLayout, widthForRowsAt indexPath: IndexPath) -> CGFloat
    
    func labelLayout(_ layout: LabelLayout, heightForRowAt indexPath: IndexPath) -> CGFloat
   
}

class LabelLayout: UICollectionViewFlowLayout
{
    weak var delegate : LabelLayoutDategate?
    
    fileprivate var atributes = [UICollectionViewLayoutAttributes]()
    
    /*item之间的水平间距*/
    var itemMargin : CGFloat = 5
    
    /*item之间的上下间距*/
    var lineMargin : CGFloat = 5
    
    var isScroll : Bool = true
 
}

extension LabelLayout
{
    override func prepare() {
        super.prepare()
        
        atributes.removeAll()
        guard let collectionView = collectionView else {
            return
        }
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        let collectionW = collectionView.bounds.width

        var itemX : CGFloat = sectionInset.left
        var itemY : CGFloat = sectionInset.top
        
        //当前行数的个数
        var currentRowCols : Int = 0
        
        for i in 0..<itemCount {
            
            let indexPath = IndexPath(item: i, section: 0)
            
            var currentW : CGFloat = delegate?.labelLayout(self, widthForRowsAt: indexPath) ?? 0
            
            let itemH : CGFloat = delegate?.labelLayout(self, heightForRowAt: indexPath) ?? 10
            
            if currentW + sectionInset.left + sectionInset.right + itemMargin * 2 > collectionW
            {
                currentW = collectionW - sectionInset.left - sectionInset.right - itemMargin * 2
            }
            
            let itemMaxX  = atributes.last?.frame.maxX ?? (sectionInset.left + itemMargin)
            
            // 先判断在当前行的索引 在当前行
            if itemMaxX + currentW + sectionInset.right + itemMargin - collectionW <= 0
            {
                //第一次来的时候在同一行的情况
                if i == 0
                {
                    itemX += itemMargin
                }
                else{
                    
                    itemX = itemMaxX + itemMargin
                }
            }
            else
            {
                itemX = sectionInset.left + itemMargin
                currentRowCols += 1
            }
            
            itemY = sectionInset.top + (itemH + lineMargin)*CGFloat(currentRowCols)
                       
            let atribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            atribute.frame = CGRect(x: itemX, y: itemY, width: currentW, height: itemH)
           
            atributes.append(atribute)

        }
               
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return atributes
    }
    
    override var collectionViewContentSize: CGSize
        {
        //不可以滚动
        if !isScroll {
          return CGSize()
        }
        let height = atributes.last?.frame.maxY ?? 0
        return CGSize(width: 0, height: height + sectionInset.bottom)
    }

}
