//
//  ToDoItem.swift
//  todoList
//
//  Created by Aaryan Kothari on 07/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var createdAt : Date?
    @NSManaged public var title : String?
}


extension ToDoItem {
    static func getALLToDoItems() -> NSFetchRequest<ToDoItem> {
        let request : NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
