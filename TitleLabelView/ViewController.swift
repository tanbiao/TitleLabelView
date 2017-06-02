//
//  ViewController.swift
//  test1
//
//  Created by 西乡流水 on 17/5/12.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var text = ""
    
    var textField = UITextField()
     
    // xib 创建
    @IBOutlet weak var titleLabelView: TitleLabelView!
    
    lazy var alert : UIAlertController = {
    
        let alert = UIAlertController(title: "请输入你要填加的标题", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            
            print("text======\(textField.text)")
            self.text = textField.text!
            self.textField = textField;
//            self.titleLabelView.inserItem(title: textField.text!)
//            alert.dismiss(animated: true, completion: nil);
        }
        
        let action1 = UIAlertAction(title: "取消", style: .cancel) { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }
        
        let action2 = UIAlertAction(title: "确定", style: .default) { (action) in
            
            guard let text = self.textField.text else{
                alert.dismiss(animated: true, completion: nil)
                return
            }
            self.titleLabelView.insertItem(title: text)
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        return alert
    }()
    
    let titles = ["残障家庭残障家庭庭","农民工家庭","教职工家庭","留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童家庭留守儿童var庭","五保户", "低收入家庭","慢性病服药人群","优秀科技工作者","优秀教育工作者","社会杰出贡献者","五保户"]
    
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
        style.textColor = UIColor.darkText
//        style.itemBackGroundColor = UIColor.gray
        style.itemCornerRadius = 5;
        self.titleLabelView.style = style
        print(style)
        //代码创建
        view.addSubview(labelView)
        labelView.selectCompletion = {
         (index) in
          print("hahahahhahahaha" + "\(index)")
            
        }
                    
    }
    
    @IBAction func btnClick(_ sender: Any)
    {
       present(alert, animated: true, completion: nil)
        
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

