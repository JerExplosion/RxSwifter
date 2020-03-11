//
//  TempTableView.swift
//  RxSwifter
//
//  Created by Jerry Ren on 1/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
             
import Foundation
import UIKit


// MARK: - just a temp replacement of Rx


extension ViewController: UITableViewDataSource {
    
     // 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return toBeDoneItems.count
        
        return myViewModel.getNumberOfToDoItems()  
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
            
     // cell.textLabel?.text = toBeDoneItems[indexPath.row].taskName
        cell.textLabel?.text = myViewModel.produceTaskName(rowNumber: indexPath.row)
        
        return cell
    } // create function in viewModel to take an Int and return the taskName 
         
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            myViewModel.deleteToDoItem(rowNumber: indexPath.row)
            myTableView.reloadData()
            
        }
    }
}
            
//            let deleteContext = PersistenceRelated.context
//            let itemToBeDeleted = toBeDoneItems[indexPath.row]
//            deleteContext.delete(itemToBeDeleted)
//            toBeDoneItems.remove(at: indexPath.row)

//            do {
//                try deleteContext.save()
//                self.myTableView.reloadData()
//
//            } catch {
//                print("Error tryna delete")
//            }

     
