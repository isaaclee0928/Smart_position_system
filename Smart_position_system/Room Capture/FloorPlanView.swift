//
//  FloorPlanView.swift
//  Smart_position_system
//
//  Created by Holung Cheng on 30/1/2024.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct FloorPlanView: View {
    private let model = RoomCaptureModel.shared
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 10) {
                Divider()
                HStack(spacing: 10) {
                    VStack(spacing: 4) {
                        NavigationLink(destination: RoomCaptureScanView()){
                            VStack{
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                    .frame(height: 40)
                                    .clipped()
                                Text("Home")
                                    .font(.caption2)
                            }
                        }
                        
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .frame(height: 60)
                        .clipped()
                        .foregroundColor(.secondary)
                    }
                    NavigationLink(destination: ViewFloorPlanView()){
                        VStack{
                            Image(systemName: "map.circle.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .clipped()
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .frame(height: 60)
                    .clipped()
                    .foregroundColor(.secondary)
                    
                    NavigationLink(destination: Profile()){
                        VStack{
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .frame(height: 40)
                                .clipped()
                            Text("profile")
                                .font(.caption2)
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .frame(height: 60)
                    .clipped()
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal, 15)
                .padding(.top, 5)
            }
            .frame(height: 90, alignment: .top)
            .clipped()
            .background {
                Rectangle()
                    .fill(.clear)
                    .background(Material.bar)
            }
        }
    }
}

    
    
    struct FloorPlanView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                FloorPlanView()
            }
        }
    }

