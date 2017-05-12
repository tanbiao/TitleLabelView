
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
    func labelLayout(_ layout: LabelLayout, widthForRowsAt indexPath: IndexPath) -> (currentWidth: CGFloat,nextWidth:CGFloat)
    
    func labelLayout(_ layout: LabelLayout, heightForRowAt indexPath: IndexPath) -> CGFloat
   
}

class LabelLayout: UICollectionViewFlowLayout
{
    weak var delegate : LabelLayoutDategate?
    
    fileprivate var atributes = [UICollectionViewLayoutAttributes]()
    
    /**每列有几个*/
    var cols : Int = 3

    /**标签总数*/
    var totalCount : Int = 10
    
    /*item之间的水平间距*/
    var itemMargin : CGFloat = 5
    
    /*item之间的上下间距*/
    var lineMargin : CGFloat = 5
 
}

extension LabelLayout
{
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else {
            return
        }
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        let collectionW = collectionView.bounds.width

        let itemX : CGFloat = sectionInset.left
        let itemY : CGFloat = sectionInset.top
        
        for i in 0..<itemCount {
            
            let indexPath = IndexPath(item: i, section: 0)
            
            let currentW : CGFloat = delegate?.labelLayout(self, widthForRowsAt: indexPath).0 ?? 0
            
            let nextW : CGFloat = delegate?.labelLayout(self, widthForRowsAt: indexPath).1 ?? 0
            
            let itemH : CGFloat = delegate?.labelLayout(self, heightForRowAt: indexPath) ?? 10
            
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
            return CGSize()
    }

}
