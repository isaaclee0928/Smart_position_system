//
//  SignUpModel.swift
//
//

import SwiftUI
import Firebase
import FirebaseAuth
//
class SignUpModel: ObservableObject {
    

    @Published var email: String = ""
    @Published var password: String = ""
    
    //Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = "Build Success"

    // create account to firebase
    func createAccount() {
        Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, err in
            // Check for errors
            if err != nil {
                // There was an error creating the user
                print("Error creating user")
                
            }
        }
    }
    
}

