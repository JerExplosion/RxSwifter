//
//  RxPart.swift
//  RxSwifter
//
//  Created by Jerry Ren on 2/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
 
// put the Rx table stuff in several functions to call in ViewDidload  


        // MARK: - Rx Table stuff
//
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




// MARK: - These above codes all go into the viewDidLoad               
