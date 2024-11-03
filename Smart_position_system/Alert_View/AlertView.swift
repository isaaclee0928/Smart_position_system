//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Paul Hudson on 08/05/2024.
//



import SwiftUI
import UserNotifications
import Firebase
import BackgroundTasks

struct AlertView: View {
  
    
    var body: some View {
        
        let test1 = 0
        VStack {
            
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                
                let test1 = 1
                
            }
            
        }
     
        }
    
    }

private func handleBackGroundTask(task: BackgroundTask<Any, Any>) {
    scheduleNextRefresh()
}

private func sendNotifcation(){
    @ObservedObject var viewmodel = FirestoreManager()
    let status = false //Var For Check User Status
    
    //**Fetch Data From Firebase*//
    ForEach(viewmodel.Tag) { tag in
        if tag.UserStatus{
            let status = tag.UserStatus
        }
    }
    
    if status{
        let content = UNMutableNotificationContent()
        content.title = "Out of range"
        content.subtitle = "is out of range"
        content.sound = UNNotificationSound.default
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
               UNUserNotificationCenter.current().add(request)
    }
  
}
private func scheduleNextRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.yourapp.checkLocation")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule task: (error)")
        }
    }
    



#Preview {
    AlertView()
}
