//
//  ContentView.swift
//  Smart_position_system
//
//  Created by Man Ho Ching on 30/1/2024.
//

import SwiftUI
import CoreData
import Firebase

struct ContentView: View {
    // Log Status
    @AppStorage("log_status") var logStatus: Bool = false
    @EnvironmentObject var firestoreManager: FirestoreManager
    var body: some View {

        NavigationView {
            if logStatus{
                WelcomeView().navigationBarBackButtonHidden(false)
            }else {

                SignInView().navigationBarBackButtonHidden(true)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(false)
        .navigationTitle("")
        .onAppear{
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                    .environmentObject(FirestoreManager())
    }
}
