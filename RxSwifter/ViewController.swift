//
//  ViewController.swift
//  RxSwifter
//
//  Created by Jerry Ren on 1/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreData



class ViewController: UIViewController {
    
    let myViewModel = MyViewModel()
  
//    var toBeDoneItems = [ToBeDone]()
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func addButtonTouched(_ sender: Any) {
        
        let yourAlert = UIAlertController(title: "Add To-Do", message: nil, preferredStyle: .alert)
        
        yourAlert.addTextField { (textField) in
            textField.placeholder = "What's my next task?"
        }

        let yourAction = UIAlertAction(title: "Save~", style: .default) { [weak self] (_) in
            let firstTextfieldContent = yourAlert.textFields?.first?.text
            print(firstTextfieldContent)
            
//            let newToDoItem = ToBeDone(context: PersistenceRelated.context)
//            newToDoItem.taskName = firstTextfieldContent
      //      toBeDoneItems.append(newToDoItem)
     //       PersistenceRelated.saveContext()
            
            self?.myViewModel.createOneNewSingleItem(contentOfToDoItem: firstTextfieldContent ?? "")
               
            self?.myTableView.reloadData() // view-related stuff so stay in the view layer
            
        }
        yourAlert.addAction(yourAction)
        present(yourAlert, animated: true, completion: nil)    
    }
    
    
    
  //  var shownCities = [String]()
    let myDisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        myTableView.dataSource = self
        
        myViewModel.fetchItems()
        
        myTableView.reloadData()
        
//        let fetchRequest: NSFetchRequest<ToBeDone> = ToBeDone.fetchRequest()
//
//        do {
//            let toBeDoneStuff = try PersistenceRelated.context.fetch(fetchRequest)
//            self.toBeDoneItems = toBeDoneStuff
//            self.myTableView.reloadData()
//        } catch {
//            print("some kinda error")
//        }
        
    }
}

//        let objArray: Observable<[Person]> = Observable.just(personArray)
//
//        let allCitiesObservable = Observable.just(allCities)
//
//        objArray.bind(to: myTableView.rx.items(cellIdentifier: "cello")) {
//            _ , person, cell in
//
//            if let cellToUse = cell as? UITableViewCell {
//                cellToUse.textLabel?.text = person.name
//            }
//        }.disposed(by: myDisposeBag)
//
//        myTableView.rx.modelSelected(Person.self).subscribe(onNext: {
//                person in
//            print(person.name)
//
//
//            }).disposed(by: myDisposeBag)
//
//        myTableView.rx.itemSelected.subscribe(onNext: { [weak self]
//            indexpath in
//            if let cell = self?.myTableView.cellForRow(at: indexpath) as? UITableViewCell {
//                cell.textLabel?.text = self?.toBeDoneItems[indexpath.row].taskName // "{-swiped"
//            }
//
//            }).disposed(by: myDisposeBag)
//
//
//        allCitiesObservable.bind(to: myTableView.rx.items(cellIdentifier: "cello")) {
//
//            _ , _ , cell in
//            if let cellToBeUsed = cell as? UITableViewCell {
//              //  cellToBeUsed.textLabel?.text = self.allCities[2]
//            }
//        }.disposed(by: myDisposeBag)


// MARK: -

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return toBeDoneItems.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = myTableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
//
//        cell.textLabel?.text = toBeDoneItems[indexPath.row].taskName
//
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//
//            let deleteContext = PersistenceRelated.context
//            let itemToBeDeleted = toBeDoneItems[indexPath.row]
//            deleteContext.delete(itemToBeDeleted)
//            toBeDoneItems.remove(at: indexPath.row)
//
//            do {
//                try deleteContext.save()
//                self.myTableView.reloadData()
//
//            } catch {
//                print("Error tryna delete")
//            }
//        }
//    }
//}


