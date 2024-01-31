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
    
    var body: some View {

        NavigationView {
            if logStatus{
                FloorPlanView().navigationBarBackButtonHidden(false)
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
    }
}
