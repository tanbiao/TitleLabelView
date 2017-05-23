//
//  ViewController.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // xib 创建
    @IBOutlet weak var titleLabelView: TitleLabelView!
    
    let titles = ["残障家庭残障家庭庭","农民工家庭","教职工家庭","留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童var庭","五保户", "低收入家庭","慢性病服药人群","优秀科技工作者","优秀教育工作者","社会杰出贡献者"]
    
    lazy var labelView : TitleLabelView = {
    
        let frame = CGRect(x: 50, y: 100, width: 300, height: 200)

        let labelView = TitleLabelView(frame:frame , titles: self.titles, style: LabelStyle())
        labelView.delegate = self
        labelView.backgroundColor = UIColor.gray
        
        return labelView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabelView.titles = self.titles
        self.titleLabelView.delegate = self
        var style = LabelStyle()
        style.textColor = UIColor.yellow
        style.itemBackGroundColor = UIColor.gray
        style.labelViewBackGroundColor = UIColor.red
        self.titleLabelView.style = style
        
        //代码创建
        view.addSubview(labelView)
        
        labelView.selectCompletion = {
         (index) in
          print("hahahahhahahaha" + "\(index)")
            
        }
                
    }
    
    @IBAction func btnClick(_ sender: Any)
    {
        let i = arc4random() / 100
        let name = "张三" + "\(i)号"
        labelView.inserItem(title: name)
        print(labelView.contentHeight)
    }
 
}

extension ViewController : TitleLabelViewDelegate
{
    func titleLabelView(_ labelView: TitleLabelView, didSelectItemAt index: Int)
    {
        print(index)
    }
    
    func titleLabelView(_ labelView: TitleLabelView, didUpdateContentHeight height:CGFloat)
    {
    
    }
    
}

