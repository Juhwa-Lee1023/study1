//
//  AuthState.swift
//  testfb
//
//  Created by 이주화 on 2022/05/06.
//

import FirebaseAuth
import Firebase
import SwiftUI

final class AuthState: ObservableObject {
    var user: User? {
        didSet{
            objectWillChange.send()
        }
    }
    
    func login(id: String, password: String){
        Auth.auth().signIn(withEmail: id, password: password)
    }
    
    func signup(id: String, password: String){
        Auth.auth().createUser(withEmail: id, password: password)
    }
    
    func listenAuth(){
        Auth.auth().addStateDidChangeListener{[weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signout(){
        try? Auth.auth().signOut()
    }
}
