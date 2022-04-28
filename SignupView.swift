//
//  SignupView.swift
//  study1
//
//  Created by 이주화 on 2022/04/28.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            TextField("email", text: $email)
            SecureField("password", text: $password)
            Button(action : {
                SignUp()
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
    
    func SignUp(){
        Auth.auth().createUser(withEmail: email, password: password)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
