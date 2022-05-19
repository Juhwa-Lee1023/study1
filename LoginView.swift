//
//  ContentView.swift
//  study1
//
//  Created by 이주화 on 2022/04/28.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var showSignup = false
    @State var showAlert = false
    
    var body: some View {
            VStack{
                TextField("email", text: $email)
                SecureField("password", text: $password)
                HStack{
                    Button(action : {
                        login()
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                            HStack{
                                Text("로그인")
                            }
                        }.frame(width: 60, height: 30)
                    }
                    Button(action : {
                        showSignup.toggle()
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                            HStack{
                                Text("회원가입")
                            }
                        }.frame(width: 60, height: 30)
                    }
                }
                
            }
            .sheet(isPresented: $showSignup){
                SignupView()
            }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ (Result, Error) in
            if Error != nil{
                print("fail login")
            } else{
                print("sucess login")
            }
            
           
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


