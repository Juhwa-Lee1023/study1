//
//  todoViewModel.swift
//  testfb
//
//  Created by 이주화 on 2022/05/19.
//

import Foundation
import Combine


class todoViewModel : ObservableObject, Identifiable{
    private let todoMethod = TodoMethod()
    @Published var todo : Todo
    
    private var cancellables: Set<AnyCancellable> = []
    var id = ""

    init(todo: Todo) {
        self.todo = todo
        $todo
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
}


