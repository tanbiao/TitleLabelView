//
//  ViewController.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let titles = ["残障家庭","农民工家庭","教职工家庭","留守儿童家庭","五保户", "低收入家庭","慢性病服药人群","优秀科技工作者","优秀教育工作者","社会杰出贡献者"]
        
        let labelView = TitleLabelView(frame:frame , titles: titles, style: LabelStyle())
        labelView.backgroundColor = UIColor.gray
        view.addSubview(labelView)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

