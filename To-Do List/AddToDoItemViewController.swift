//
//  AddViewItemViewController.swift
//  To-Do List
//
//  Created by Amy Wong on 2/25/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    @IBOutlet weak var ToDoListItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! ToDoListTableViewController // contains textfield
        destVC.model.append(ToDoListItem.text!)
        print ("hiiii")
        return
        
    }
}
