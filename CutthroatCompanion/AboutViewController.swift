//
//  AboutViewController.swift
//  CutthroatCompanion
//
//  Created by Luis Rangel on 5/19/19.
//  Copyright © 2019 Luis Rangel. All rights reserved.
//

import UIKit
import os.log

class AboutViewController: UIViewController {
 
    @IBOutlet weak var tv_letter: UITextView!
    @IBOutlet weak var l_versionNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        l_versionNumber.text = "Version " + appVersion!
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tv_letter.setContentOffset(CGPoint.zero, animated: false)
    }
}
