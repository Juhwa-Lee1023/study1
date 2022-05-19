//
//  todoReadView.swift
//  study1
//
//  Created by 이주화 on 2022/05/19.
//
import SwiftUI

struct todoReadView: View {
    var todoviewModel: todoViewModel
    
    var body: some View {
        VStack{
            Text(todoviewModel.todo.name)
            Text(todoviewModel.todo.today)
        }
    }
}

