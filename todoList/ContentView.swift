//
//  ContentView.swift
//  todoList
//
//  Created by Aaryan Kothari on 07/03/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems : FetchedResults<ToDoItem>
     
    @State private var newToDoItem = ""
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Whats next?")) {
                    HStack{
                        TextField("New Item", text: $newToDoItem)
                        Button(action: {
                            print("button")
                            let toDoItem = ToDoItem(context: self.moc)
                            toDoItem.title = self.newToDoItem
                            toDoItem.date = Date()
                            do{
                                try self.moc.save()
                            }catch{
                                print("error")
                            }
                            self.newToDoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }.font(.headline)
                }
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems){item in
                        ToDoItemView(title: item.title!, date: "\(item.date)")
                    }
                }
            }
                
                
            .navigationBarTitle("My list")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ToDoItemView : View {
    var title : String = ""
    var date : String = ""
    var body: some View{
        HStack{
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(date)
                    .font(.caption)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
