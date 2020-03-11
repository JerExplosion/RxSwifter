//
//  MyViewModel.swift
//  RxSwifter
//
//  Created by Jerry Ren on 2/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import CoreData
import RxSwift
import RxCocoa

class MyViewModel {
    
    private var toBeDoneItems = [ToBeDone]()   // Observable<[ToBeDone]>()
    
    func getNumberOfToDoItems() -> Int {
        
        return toBeDoneItems.count
        
    }

    
    func createOneNewSingleItem(contentOfToDoItem: String) {
        
        let newToDoItem = ToBeDone(context: PersistenceRelated.context)
        newToDoItem.taskName = contentOfToDoItem
        
        toBeDoneItems.append(newToDoItem)
        PersistenceRelated.saveContext()
         
    }
    
    func produceTaskName(rowNumber: Int) -> String {
         
        guard let taskName = toBeDoneItems[rowNumber].taskName else {
            return "Nothing"
        }
        return taskName
    }
    
     
    
    func deleteToDoItem(rowNumber: Int) {
         let deleteContext = PersistenceRelated.context
         let itemToBeDeleted = toBeDoneItems[rowNumber]
         deleteContext.delete(itemToBeDeleted)
         toBeDoneItems.remove(at: rowNumber)
        do {
            try deleteContext.save()
        } catch {
             print("Error tryna delete")
        }
    }
    
    func fetchItems() {
        
        let fetchRequest: NSFetchRequest<ToBeDone> = ToBeDone.fetchRequest()
             
        do {
            let toBeDoneStuff = try PersistenceRelated.context.fetch(fetchRequest)
            self.toBeDoneItems = toBeDoneStuff
        } catch {
            print("some kinda error")
        }
    }
    
    
}
