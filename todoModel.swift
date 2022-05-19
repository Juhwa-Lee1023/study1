//
//  todoModel.swift
//  testfb
//
//  Created by 이주화 on 2022/05/18.
//

import Foundation

import Combine

class todoModel : ObservableObject{
    
    @Published var todoViewModels : [todoViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    @Published var todoMethod = TodoMethod()
    
    
    
    init(){
        todoMethod.$todos.map { todos in
            todos.map(todoViewModel.init)
        }
        
        .assign(to: \.todoViewModels, on: self)
        
        .store(in: &cancellables)
    }
    
    func create(_ todo: Todo){
        todoMethod.create(todo)
    }
    
    
}
