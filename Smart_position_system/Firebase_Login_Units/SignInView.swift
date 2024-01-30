//
//  SignInView.swift
//  Fitness-walking-tracks
//
//  Created by Man Ho Ching on 30/1/2024.
//

import SwiftUI
import Firebase
struct SignInView: View {
    
    @StateObject var loginModel: LoginModel = LoginModel()
    
    // FaceID Properties
    @State var useFaceID: Bool = false
    
    
    
    @State var maxCircleHeight: CGFloat = 0
    
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
                //Login UI
                    ZStack{
                        Circle()
                            .fill(Color("IconRed"))
                            .offset(x: getRect().width / 2, y: -height / 1.5)
                        Circle()
                            .fill(Color("IconYellow"))
                            .offset(x: -getRect().width / 2, y: -height / 1.7)
                        Circle()
                            .fill(Color("IconOrange"))
                                .offset(y: -height / 1.5)
                                .rotationEffect(.init(degrees: -5))
                        
                    }
                )
            }
            .frame(maxHeight: getRect().width)
        
    
        //
        VStack{
            
    
            
            Text("Hey\n")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .hLeading()
            Text("Login Now")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .hLeading()
            //TextField For Input
            TextField("Email", text: $loginModel.email)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            loginModel.email == "" ? Color.black.opacity(0.05): Color("Orange"))
                    
                }
                .textInputAutocapitalization(.never)
                .padding(.top, 20)
            
            SecureField("Password", text: $loginModel.password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            loginModel.password == "" ? Color.black.opacity(0.05): Color("Orange"))
                    
                }
                .textInputAutocapitalization(.never)
                .padding(.top, 15)
            
            // User Prompt to ask to store Login using FaceID on next time
            if loginModel.getBioMetricStatus() {
                Group {
                    if loginModel.useFaceID {
                        
                        Button {
                            // Do FaceID Action
                            Task {
                                do {
                                    try await loginModel.authenticateUser()
                                    
                                } catch {
                                    loginModel.errorMsg = error.localizedDescription
                                    loginModel.showError.toggle()
                                }
                            }
                    
                    }label: {
                            VStack(alignment: .leading, spacing: 10) {
                                Label {
                                    Text("Use FcaeID to login into previous account")
                                    
                                } icon: {
                                    Image(systemName: "faceid")
                                    
                                }
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                                Text("Note: You can trun of it in settings !")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .hLeading()
                        
                    } else {
                        Toggle(isOn: $useFaceID) {
                            Text("Use FaceID to Login")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            

            Button{
                Task{
                    do{
                        try await loginModel.loginUser(useFaceID: useFaceID)
                        
                    } catch {
                        loginModel.errorMsg = error.localizedDescription
                        loginModel.showError.toggle()
                    }
                }
                
            } label: {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .hCenter()
                    .background {
                        RoundedRectangle(cornerRadius: 8).fill(Color(.brown))
                    }
            }
            .padding(.vertical, 35)
            .disabled(loginModel.email == "" || loginModel.password == "")
            .opacity(loginModel.email == "" || loginModel.password == "" ? 0.5 : 1)
            
            //Button To Create Account
            NavigationLink {
                SignUpView()
            } label: {
                Text("create account")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical)
        .alert(loginModel.errorMsg, isPresented: $loginModel.showError){
            
        }
        .padding(.top,-maxCircleHeight / 2.0)
        .frame(maxHeight: .infinity, alignment:  .top)
      
        }
        
        .background(
            
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
            }
            ,alignment: .bottom
        )
    }
    }
    

    






struct Login_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}





// Extensions for UI Designing
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    func hLeading()-> some View{
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing()-> some View{
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter()-> some View{
        self.frame(maxWidth: .infinity, alignment: .center)
    }
}
