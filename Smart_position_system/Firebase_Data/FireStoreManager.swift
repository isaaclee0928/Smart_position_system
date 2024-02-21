//
//  FireStoreManager.swift
//  Smart_position_system
//
//  Created by Man Ho Ching on 20/2/2024.
//

import Foundation

import Firebase
import FirebaseFirestore


class FirestoreManager: ObservableObject {
//    init() {
//        FetchCoordinate()
//    }
    @Published var anchor: [Anchor_Coordinate] = []
    
    func FetchCoordinate() {
        let db = Firestore.firestore()
        let documentRef = db.collection("Anchor")
        documentRef.addSnapshotListener {(snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let snapshot = snapshot, !snapshot.isEmpty {
                    print("Posted data got")
                    
                    
                    self.anchor = snapshot.documents.map { document in
                        let data = document.data()
                        //Anchor_Coordinate(coordinate: document.get("coordinate") as? [Float] ?? [0] )
                        
                        let coordinate = data["coordinate"] as? [Float] ?? []
                        
                        return Anchor_Coordinate(coordinate: coordinate)
                    }
                    //print(self.anchor[0])
                    
                } else {
                    print("GET POSTED MESSAGES no data")
                }
            }
        }
        
    }
}
