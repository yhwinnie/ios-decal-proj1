//
//  AddTaskViewController.swift
//  toDoList
//
//  Created by Winnie Wen on 10/10/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var itemText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.itemText.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddTask(sender: AnyObject) {
        //toDoList.append(toDoItem(name: itemText.text!))
        if itemText.text != "" {
            
            let item = toDoItem(name: itemText.text!, completed: false, index: 0)
            toDoList.append(item)
        
            itemText.text = ""
        }
    
    //NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    
    }



    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }



    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        itemText.resignFirstResponder()
    return true
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
