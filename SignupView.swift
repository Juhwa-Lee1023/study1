//
//  SignupView.swift
//  study1
//
//  Created by 이주화 on 2022/04/28.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @EnvironmentObject var authModel : AuthState
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            TextField("email", text: $email)
            SecureField("password", text: $password)
            Button(action : {
                authModel.signup(id: email, password: password)
                presentationMode.wrappedValue.dismiss()
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue,lineWidth: 3)
                    HStack{
                        Text("Sign Up")
                    }
                }.frame(width: 60, height: 30)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
