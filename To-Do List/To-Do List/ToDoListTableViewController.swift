//
//  ViewController.swift
//  To-Do List
//
//  Created by Amy Wong on 2/23/16.
//  Copyright © 2016 Amy Wong. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var model: [String] = []
    var completed: [String] = []
    var numItemsCompleted: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        model = [String]()
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toStats") {
            let destVC = segue.destinationViewController as! DailyStatsViewViewController
            destVC.numCompleted = completed.count
            print ("prepare for segue")
            return
        } else {
            return
        }
    }

    // this fill cells with data
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = model[indexPath.row]
        cell.accessoryType = .Checkmark
        print (cell.toDoItemTextLabel.text)
        if completed.contains(cell.toDoItemTextLabel.text!) {
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (model.count)
        return model.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            model.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem = model[indexPath.row]
        print("tapped item: " + tappedItem)
        if !(completed.contains(tappedItem)) {
            completed.append(tappedItem)
        } else {
            completed = completed.filter() {$0 != tappedItem}
        }
        print ("completed")
        print (completed)
//        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
    
    func isWithin24Hours(date: NSDate) -> Bool {
        let yesterday = NSDate(timeIntervalSinceNow: -3600*24)
        return yesterday.earlierDate(date) == yesterday
//        return false
//        var anHourAgo = NSDate(timeIntervalSinceNow: -3600)
    }


}

