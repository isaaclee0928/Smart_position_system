//
//  Profile.swift
//  Smart_position_system
//
//  Created by Holung Cheng on 25/1/2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            HStack {
                Text("Isaacs Lee")
                    
                
            }
            .font(.system(.headline, weight: .medium))
            Image("man")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
                .mask { RoundedRectangle(cornerRadius: 67, style: .continuous) }
            VStack(spacing: 4) {
                Text("Tab 1 user ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
            }
            .frame(width: 250)
            .clipped()
            
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.top, 0)
        .padding(.bottom, 0)
        
        VStack {
            Text("Setting".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
                .font(.system(.subheadline, weight: .medium).width(.expanded))
                .foregroundColor(.pink)
               
        ScrollView{
            VStack(spacing: 5) {
                ForEach(0..<5) { _ in // Replace with your data model here
                    
                                HStack(spacing: 10) {
                                    Image("dog")
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .clipped()
                                        .mask { RoundedRectangle(cornerRadius: 8, style: .continuous) }
                                    VStack(alignment: .leading) {
                                        Text("Setting")
                                            .font(.system(size: 16, weight: .medium, design: .default))
                                 
                                    }
                                    .font(.subheadline)
                                    Spacer()
                                    Image(systemName: "arrowshape.right.circle.fill")
                                        .foregroundColor(Color(.displayP3, red: 234/255, green: 76/255, blue: 97/255))
                                        .font(.title3)
                                }
                                Divider()
                            }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.top, 5)
            .padding(.bottom, -350)
        }
        
        
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
                    NavigationLink(destination: RoomCaptureScanView()){
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
        .padding(.top, 220)
    }
        
    
}


#Preview {
    Profile()
}
