//
//  ToDoItem.swift
//  todoList
//
//  Created by Aaryan Kothari on 12/04/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation
import CoreData

class ToDoItem : NSManagedObject, Identifiable{
    @NSManaged public var date : Date?
    @NSManaged public var title : String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request : NSFetchRequest<ToDoItem>  = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
