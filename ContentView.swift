//
//  ContentView.swift
//  study1
//
//  Created by 이주화 on 2022/04/28.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var authModel : AuthState
    @ObservedObject var todomodel = todoModel()
    @State var showLogin = false
    @State var showCreate = false
    
    
    var body: some View {
            VStack{
                HStack{
                    Spacer()
                    Button(action:{
                        showLogin.toggle()
                    }){
                            
                        ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 3)
                                HStack{
                                    Image(systemName: "person")
                                        .foregroundColor(Color.blue)
                                }
                            }.frame(width: 40, height: 40)
                            
                        }
                    
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action:{
                        showCreate.toggle()
                    }){
                            
                        ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 3)
                                HStack{
                                    Text("도전 만들러 가기")
                                        .foregroundColor(Color.blue)
                                }
                            }.frame(width: 120, height: 40)
                            
                        }
                    
                }
                Spacer()
                HStack
                {
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(todomodel.todoViewModels) { todoviewModel in
                                todoReadView(todoviewModel: todoviewModel)
                            }
                        }
                    }
                }
                
                
                
            }.sheet(isPresented: $showLogin){
                LoginView()
            }
            .sheet(isPresented: $showCreate){
                todoCreateView(todomodel: todoModel())
            }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(todomodel: todoModel())
    }
}


