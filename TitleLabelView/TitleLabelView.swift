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
    var contentHeight : CGFloat
        {
       return collectionView.contentSize.height
    }
    
    fileprivate var  titles : [String]
    fileprivate var  style : LabelStyle
    fileprivate lazy var collectionView : UICollectionView =
        {
          let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: self.layout)
          collectionView.dataSource = self
          collectionView.registerCell(TitleLabelViewCell.self)
          collectionView.backgroundColor = self.style.labelViewBackGroundColor
          collectionView.bounces = false
            
          return collectionView
    }()
    
    fileprivate lazy var layout : LabelLayout =
        {
          let layout = LabelLayout()
          layout.delegate = self
          layout.itemMargin = self.style.itemMargin
          layout.lineMargin = self.style.lineMargin
          layout.sectionInset = self.style.labelViewInsert
          return layout
    }()
    
    init(frame: CGRect,titles : [String], style : LabelStyle) {
        self.titles = titles
        self.style = style
        super.init(frame: frame)
        setupInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 对外提供的接口
extension TitleLabelView
{
    /// 增加items
    func insertItems(titles : [String])
    {
        self.titles.append(contentsOf: titles)
        reloadData()
        scrollToBottom()
    }
    
    ///增加item
    func inserItem(title :String)
    {
        titles.append(title)
        reloadData()
        scrollToBottom()
    }
    
    ///刷新数据
    func reloadData()
    {
        collectionView.reloadData()
    }

}

extension TitleLabelView
{
    fileprivate func setupInit()
    {
        addSubview(collectionView)
    }
    
    fileprivate func scrollToBottom()
    {
        let indexPath = IndexPath(item: (titles.count - 1), section: 0)
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: false)
    }
}

// MARK: - UICollectionViewDataSource
extension TitleLabelView : UICollectionViewDataSource
{
   internal  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
   {
        return titles.count
   }
    
   internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeuResuableCell(indexPath) as TitleLabelViewCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.titleLabel.textColor = style.textColor;
        cell.cornerRadius = style.itemCornerRadius
        cell.titleLabel.font = style.textFont
        cell.titleLabel.backgroundColor = style.itemBackGroundColor
        
        return cell
    }
}


// MARK: - LabelLayoutDategate
extension TitleLabelView : LabelLayoutDategate
{    
    internal func labelLayout(_ layout: LabelLayout, widthForRowsAt indexPath: IndexPath) -> CGFloat
    {
        let title = titles[indexPath.row]
        let size = String.size(text: title, textFont: style.textFont)
            
        return size.width + 2
    }
    
   internal func labelLayout(_ layout: LabelLayout, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return String.height(textFont: style.textFont)
    }
    
}
