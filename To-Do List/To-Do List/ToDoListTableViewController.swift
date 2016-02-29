//
//  ViewController.swift
//  To-Do List
//
//  Created by Amy Wong on 2/23/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    let model = ["go to sleep", "do homework"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        model = ["hi"]
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController
            as! UINavigationController
        _ = destVC.viewControllers.first
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get some cell
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        // edit it
        cell.toDoItemTextLabel.text = model[indexPath.row]
        // return it
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    

}

