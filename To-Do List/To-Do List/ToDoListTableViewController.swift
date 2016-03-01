//
//  ViewController.swift
//  To-Do List
//
//  Created by Amy Wong on 2/23/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
//    let model = ["go to sleep!!!", "do homework!!!!"]
    var model: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      model = [String]()
//        model.append("hi")
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
//        if let sourceVC = segue.sourceViewController as? ToDoListTableViewController {
//            sourceVC.model.append(ToDoListItem.text)
//        }
        print ("bye")
        print (model)
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let sourceVC = segue.sourceViewController // this

  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get some cell
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        //  edit it
        cell.toDoItemTextLabel.text = model[indexPath.row]
        // return it
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
        }
    }
    

}

