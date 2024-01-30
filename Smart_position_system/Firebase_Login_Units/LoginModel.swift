//
//  loginView.swift
//  FruitScanner



import SwiftUI
import Firebase
import LocalAuthentication

class LoginModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    // FaceID Properties
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var FaceIDEmail: String = ""
    @AppStorage("use_face_password") var FaceIDPassword: String = ""
    
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    //Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    // Firebase Login
    func loginUser(useFaceID: Bool, email: String = "",password: String = "", byFaceID : Bool = false) async throws{
        
        DispatchQueue.main.async {
            
            if useFaceID == false || byFaceID == false {
                // Storing for future FaceID Login
                if useFaceID == true {
                    self.useFaceID = useFaceID
                }
                self.FaceIDEmail = self.email
                self.FaceIDPassword = self.password
                
            } else if useFaceID && byFaceID == true {
                //extract stored information
                self.email = self.FaceIDEmail
                self.password = self.FaceIDPassword
            }
        }
        
        //check the user use faceID success or not success
        if byFaceID == true {
            let _ = try await Auth.auth().signIn(withEmail:  self.FaceIDEmail, password: self.FaceIDPassword)
        } else {
            let _ = try await Auth.auth().signIn(withEmail: self.email, password: self.password)
        }
        
        
        DispatchQueue.main.async {
            self.logStatus = true
            
        }
    }
    
    // FaceID Usage
    func getBioMetricStatus()-> Bool {
        
        let scanner = LAContext()
        
        return scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
    }
    
    // FaceID Login
    func authenticateUser()async throws {
        
        let status = try await LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                                          localizedReason: "To Login Into App")
        
        if status{
            try await loginUser(useFaceID: useFaceID,email: self.email, password:self.password, byFaceID: true)
        }
    }
}
