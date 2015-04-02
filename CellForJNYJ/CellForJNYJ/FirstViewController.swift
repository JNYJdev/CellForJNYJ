//
//  FirstViewController.swift
//  CellForJNYJ
//
//  Created by JNYJ on 2/4/15.
//  Copyright (c) 2015 William. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var cell:JNYJCell! = JNYJCell.newCell();
        self.view.addSubview(cell);
        cell.labelCellTitle.text = "Title";
        cell.labelCellDetail.text = "Detail";
        cell.setCellHeight(44);
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

