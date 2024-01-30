//
//  SignUpView.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 17/2/2023.
//

import SwiftUI
import Firebase
struct SignUpView: View {
 
        @StateObject var signUpModel: SignUpModel = SignUpModel()
        @StateObject var loginModel: LoginModel = LoginModel()
        
        // Log Status
        @AppStorage("log_status") var logStatus: Bool = false
        
        // FaceID Properties
        @State var useFaceID: Bool = false
        @State private var toSignInView = false
        @State var maxCircleHeight: CGFloat = 0
        @State var passwordStrength : Int = 0
        
    func checkStrength(_ password: String) -> Int {
        let passwordLength = signUpModel.password.count
//        var containsSymbol = false
        var containsUppercase = false
        
        for character in password {
            //Check Uppercase Word
            if "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(character) {
                containsUppercase = true
            }
//            //Check Symbol
//            if "!£$%&/()=?^;:_ç°§*,.-_".contains(character) {
//                containsSymbol = true
//            }
        }
        
        if passwordLength > 8 && containsUppercase {
            return 1
        } else {
            return 0
        }
    }
        
        var body: some View {
            
            VStack{
            
            
                GeometryReader{proxy -> AnyView in
                    
                    let height = proxy.frame(in: .global).height
                    
                    DispatchQueue.main.async {
                        if maxCircleHeight == 0{
                            maxCircleHeight = height
                        }
                    }
                    
                    return AnyView(
                        
                        ZStack{
                            Circle()
                                .fill(Color("IconRed"))
                                .offset(x: 200 , y: -370)
                            Circle()
                                .fill(Color("IconYellow"))
                                .offset(x: -200 , y: -330)
                            Circle()
                                .fill(Color("IconOrange"))
                                .offset(x: -30 ,y: -370)
                                    .frame(width: 400, height: 400)
                            
                            
                        }
                    )
                }
  
            VStack {
                
                Text("Welcome, To Create Account")
                

                  
                TextField("Email", text: $signUpModel.email)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                signUpModel.email == "" ? Color.black.opacity(0.05): Color("Orange"))
                        
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top, 20)
                
                
                TextField("Password", text: $signUpModel.password)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                signUpModel.password == "" ? Color.black.opacity(0.05): Color("Orange"))
                        
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.top,20)
                VStack {
                    Text("- one upper character")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
//                    Text("- one symbol")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.gray)
                    Text("- at least 8 character")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                }
                                
                Button {
                    
                    signUpModel.createAccount()
                    signUpModel.showError.toggle()
                    
                } label: {
                    Text("SignUp")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8).fill(Color(.brown))
                        }
                }
                .disabled(checkStrength(signUpModel.password) == 0)
                //.disabled(signUpModel.email == "" || signUpModel.password == "" )
                .padding(.vertical, 35)
                .alert(signUpModel.errorMsg, isPresented: $signUpModel.showError){
                    Button("ok!") {
                                            toSignInView = true
                                        }
                                    }
                                    NavigationLink(isActive: $toSignInView, destination: { SignInView() }, label: {
                                        EmptyView()
                                    })
        }
            .padding(.top,-maxCircleHeight / 1.5)
            .frame(maxHeight: .infinity, alignment:  .top)
        }.background(
                HStack{
                    Circle()
                        .fill(Color("IconRed"))
                        .frame(width: 90, height: 90)
                        .offset(x:-20, y: 90)
                    Spacer(minLength: 0)
                    Circle()
                        .fill(Color("IconYellow"))
                        .frame(width: 150, height: 150)
                        .offset(x:40, y: 20)
                },alignment: .bottom
      
            )
    }
        
        
        

    struct SignUp_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
}
