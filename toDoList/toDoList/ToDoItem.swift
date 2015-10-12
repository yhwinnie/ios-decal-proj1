//
//  ToDoItem.swift
//  toDoList
//
//  Created by Winnie Wen on 10/11/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import Foundation


public class toDoItem {
    public var name: String
    public var completed: Bool
    public var index: Int
    
    
    public init(name: String, completed: Bool, index: Int) {
        self.name = name
        self.completed = completed
        self.index = index

        
    }
}
