//
//  todoCreateView.swift
//  study1
//
//  Created by 이주화 on 2022/05/19.
//

import SwiftUI

struct todoCreateView: View {
    @State var name = ""
    @State var date = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var todomodel: todoModel
    
    
    var body: some View {
        VStack{
            TextField("name", text: $name)
            TextField("date", text: $date)
            Button(action:
                    todoCreate
            ){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                    HStack{
                        Text("도전 추가")
                    }
                }.frame(width: 60, height: 60)
            }
            
        }
    }
    
    func todoCreate(){
        
        let todo = Todo(name: name, today: date)
       
        todomodel.create(todo)
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct todoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        todoCreateView(todomodel: todoModel())
    }
}
