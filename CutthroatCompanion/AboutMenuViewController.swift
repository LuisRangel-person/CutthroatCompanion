//
//  AboutMenuViewController.swift
//  CutthroatCompanion
//
//  Created by Luis Rangel on 5/19/19.
//  Copyright © 2019 Luis Rangel. All rights reserved.
//

import UIKit
import os.log

class AboutMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.isHidden = false;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            self.navigationController!.navigationBar.isHidden = true;
        }
    }
}
