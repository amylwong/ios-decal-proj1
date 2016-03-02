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
    var completedTaskTime: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = [String]()
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toStats") {
            let destVC = segue.destinationViewController as! DailyStatsViewViewController
            destVC.numCompleted = completed.count
            return
        } else {
            return
        }
    }

    // this fill cells with data
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = model[indexPath.row]
        if completed.contains(cell.toDoItemTextLabel.text!) {
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
        if completed.contains(cell.toDoItemTextLabel.text!) {
            let task = getTaskObject(cell.toDoItemTextLabel.text!)
            if !isWithin24Hours(task.timeCompleted!) {
                model.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
        return cell
    }
    
    func getTaskObject(taskName: String) -> Task {
        for task: Task in completedTaskTime {
            if task.name == taskName {
                return task
            }
        }
        return Task() // don't know what other Task to return...
    }
    
    func itemIsAlreadyChecked(taskName: String) -> Bool {
        for task: Task in completedTaskTime {
            if (task.name == taskName) {
                return true
            }
        }
        return false
    }
    
    func deleteUncheckedTaskObject(taskName: String) {
        var updatedArray: [Task] = []
        for task: Task in completedTaskTime {
            if (task.name != taskName) {
                updatedArray.append(task)
            }
        }
        completedTaskTime = updatedArray
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            model.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem = model[indexPath.row]
        let taskItem = Task()
        taskItem.name = tappedItem
        taskItem.timeCompleted = NSDate()
        if !(completed.contains(tappedItem)) {
            completed.append(tappedItem)
            completedTaskTime.append(taskItem)
        } else {
            completed = completed.filter() {$0 != tappedItem}
            deleteUncheckedTaskObject(tappedItem)
        }
        tableView.reloadData()
        
    }
    
    func isWithin24Hours(date: NSDate) -> Bool {
        let yesterday = NSDate(timeIntervalSinceNow: -3600*24)
        return yesterday.earlierDate(date) == yesterday
    }

}

