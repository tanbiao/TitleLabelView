//
//  ShowTextViewController.swift
//  TitleLabelView
//
//  Created by 西乡流水 on 17/5/24.
//  Copyright © 2017年 西乡流水. All rights reserved.
//

import UIKit

class ShowTextViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var text : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLabel()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
    }
    
    func initLabel()
    {
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 500, height: 50));
        label.text = self.text
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = UIColor.red
        scrollView.backgroundColor = UIColor.gray;
        scrollView.contentSize = CGSize.init(width: 500 , height: 0)
        scrollView.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }
  

}
