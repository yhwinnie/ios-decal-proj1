//
//  ViewController.swift
//  To-Do List
//
//  Created by Winnie Wen on 10/6/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import UIKit



var toDoList = [toDoItem]()
var num = 0
var numTaskCompleted = "\(num) Tasks"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var deleteLabel: UILabel!
    @IBOutlet weak var toDoListTable: UITableView!
    var completedItem = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = "Cell"
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        
        deleteLabel.hidden = true
        
        var timer = NSTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3600, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        

        //if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        //toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let task = toDoList[indexPath.row]
        cell.textLabel?.text = task.name
        deleteLabel.hidden = false
        if task.completed {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None

        }
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            toDoList.removeAtIndex(indexPath.row)
            toDoListTable.reloadData()
            if toDoList.count == 0 {
                deleteLabel.hidden = true
            }
        }
    }
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem = toDoList[indexPath.row]
        tappedItem.completed = !tappedItem.completed
        if tappedItem.completed == true {
            tappedItem.index = indexPath.row
            completedItem.append(tappedItem.index)
            num += 1
            if num == 1 {
                numTaskCompleted = "\(num) Task"
            }
            else {
                numTaskCompleted = "\(num) Tasks"
            }
        }
        else {
            num -= 1
            if num == 1 {
                numTaskCompleted = "\(num) Task"
        
            }
            else {
            numTaskCompleted = "\(num) Tasks"
            }
        }
        toDoListTable.reloadData()
    }
    
    func result() {
        var first = 0
        for index in completedItem {
            print(index)
            if first == 0 {
                toDoList.removeAtIndex(index)
            }
            else if index == 0 {
                toDoList.removeAtIndex(index)
            } else {
                toDoList.removeAtIndex(index - 1)
                print(toDoList)
            }
            first += 1
            toDoListTable.reloadData()
            completedItem = [Int]()
            num = 0
            numTaskCompleted = "\(num) Task"
            
        
        if toDoList.isEmpty {
            deleteLabel.hidden = true
        }
        
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
}


