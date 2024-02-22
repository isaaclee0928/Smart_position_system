//
//  DisplayView.swift
//  Smart_position_system
//
//  Created by Man Ho Ching on 20/2/2024.
//

import SwiftUI
import Firebase

struct DisplayView: View {
    @ObservedObject var viewmodel = FirestoreManager()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
        
    var body: some View {

        ZStack {
            
            Image("Floor-Plan")
                .resizable()
                
            //Firestore Call coordinate real time display
            ForEach(viewmodel.anchor) { Anchors in
                VStack(alignment: .leading) {
                    Image(systemName: "")
                        .frame(width: 10, height: 10)
                        .background(Color.green)
                        .position( /// here!
                            x: CGFloat(Anchors.coordinate[0]),
                            y:  CGFloat(Anchors.coordinate[1])
                        )
                }
            }
//            List(viewmodel.anchor) { Anchors in
//                                VStack(alignment: .leading) {
//                                    Image(systemName: "")
//                                        .frame(width: 30, height: 30)
//                                        .background(Color.green)
//                                        .position( /// here!
//                                            x: CGFloat(Anchors.coordinate[0]),
//                                            y:  CGFloat(Anchors.coordinate[1])
//                                        )
//                                }
//                            }

            
        }.onAppear(){self.viewmodel.FetchCoordinate()}
        
        }
}

#Preview {
    DisplayView()
}
