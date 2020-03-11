//
//  basicViewModel.swift
//  RxSwifter
//
//  Created by Jerry Ren on 2/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation


class BasicViewModel {
    
    func numOfItemsInSection(section: Int) -> Int {
        
        return section
        
    }
    
    var personFromModel: PersonModel
    
    init(name: String, age: Int) {
        self.personFromModel = PersonModel(personName: name, personAge: age)
    }
                   
    
    // business logic of the to do list is that everything related the task should live in the viewModel
    
    // array of tasks would be here
    // function for create task or complete task
    
    // model would be the design for the class / the objects 
    
    
    // controller would only be used for presentation
    
    // actions always in the viewController
    // outlets can be in the view (if strictly MVVM)
    
    

    
}
