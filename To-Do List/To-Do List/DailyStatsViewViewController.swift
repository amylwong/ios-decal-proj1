//
//  DailyStatsViewViewController.swift
//  To-Do List
//
//  Created by Amy Wong on 3/1/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import UIKit

class DailyStatsViewViewController: UIViewController {
    
    @IBOutlet weak var numberItemsCompletedLabel: UITextView!
    var numCompleted = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        numberItemsCompletedLabel.text = String(numCompleted)
    }
}
