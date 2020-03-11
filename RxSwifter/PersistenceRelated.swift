//
//  PersistenceRelated.swift
//  RxSwifter
//
//  Created by Jerry Ren on 2/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import CoreData

class PersistenceRelated {
    
    private init() {}
      
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CDModel") // must have the same name as the .xcdatamodel file
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
     
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    

    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Just to make sure that it saved")
            } catch {
          
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
}
