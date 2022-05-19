//
//  ContentView.swift
//  study1
//
//  Created by 이주화 on 2022/04/28.
//

import SwiftUI
import Firebase

struct ContentView: View {

    @State var showLogin = false
    @State var i = 0
    @State var c = false
    
    var body: some View {
            VStack{
                HStack{
                    Spacer()
                    Button(action:{
                        //add action
                    }){
                        ZStack{
                           RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red ,lineWidth: 10)
                            HStack{
                                Image(systemName: "person")
                                    .foregroundColor(Color.blue)
                            }
                        }.frame(width: 40, height: 60)
                    }
                }
                List(todo){ todos in
                    HStack{
                        Button(action:{
                            c.toggle()
                            i += 1
                        })
                        {
                            Text("\(todos.name)")
                        }
                    }
                    
                    
                }
            }.sheet(isPresented: $c){
                DetailView(i: i)
            }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


