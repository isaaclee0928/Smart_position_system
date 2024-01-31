//
//  ViewFloorPlanView.swift
//  Smart_position_system
//
//  Created by Holung Cheng on 31/1/2024.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct ViewFloorPlanView: View {
    private let model = RoomCaptureModel.shared
    
    @State private var isScanning = false
    @State private var isShowingFloorPlan = false
    
    var body: some View {
        ZStack{
            RoomCaptureRepresentable()
        }
   
            
            // Show the floor plan in full screen
        .fullScreenCover(isPresented: $isShowingFloorPlan) {
                SpriteView(scene: FloorPlanScene(capturedRoom: model.finalRoom!))
                    .ignoresSafeArea()
            }
            }
        }
   
    





struct ViewFloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        ViewFloorPlanView()
    }
}
