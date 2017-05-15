//
//  ViewController.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var labelView : TitleLabelView = {
    
        let frame = CGRect(x: 50, y: 100, width: 300, height: 100)
        let titles = ["残障家庭","农民工家庭","教职工家庭","留守儿童家庭","五保户", "低收入家庭","慢性病服药人群","优秀科技工作者","优秀教育工作者","社会杰出贡献者"]
        
        let labelView = TitleLabelView(frame:frame , titles: titles, style: LabelStyle())
        labelView.backgroundColor = UIColor.gray
        
        return labelView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.addSubview(labelView)
       
    }
    
    @IBAction func btnClick(_ sender: Any)
    {
        let titles = ["张三"]
        
        labelView.insertItems(titles: titles)
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

