//
//  AlarmManager.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import SwiftUI
import UserNotifications
import FirebaseFirestore

// This would be your Alarm Manager class
class AlarmManager: ObservableObject {
    @Published var alarms: [Alarm] = []
//    @EnvironmentObject var viewModel: AuthViewModel
    
    private let db = Firestore.firestore()
    
//    var userId: String
    
//    init(userId: String) {
////        
//    }
    
    func fetchAlarms(forUserId userId: String) {
        // Use Firestore to fetch alarms for the current user
        
//        db.collection("alarms")
//            .whereField("userId", isEqualTo: viewModel.currentUser?.id)
//            .addSnapshotListener { (querySnapshot, error) in
//                guard let documents = querySnapshot?.documents else {
//                    print("No documents for user \(self.viewModel.currentUser?.id)")
//                    return
//                }
//                
//                self.alarms = documents.compactMap { queryDocumentSnapshot -> Alarm? in
//                    try? queryDocumentSnapshot.data(as: Alarm.self)
//                }
//            }
        print("fetch Alarms for \(userId)")
    }
    
    func createAlarm(_ alarm: Alarm) {
//        // Save a new alarm to Firestore
//        
//        do {
////
//            let _ = try db.collection("alarms").addDocument(from: alarm)
//        } catch {
//            print("There was an error adding the alarm: \(error.localizedDescription)")
//        }
        
        print("Create Alarm \(alarm)")
    }
    
    func updateAlarm(_ alarm: Alarm) {
        // Update an existing alarm in Firestore
        
//        guard let alarmId = try? alarm.id else { return }
//        
//        do {
//            try db.collection("alarms").document(alarmId).setData(from: alarm)
//        } catch {
//            print("There was an error updating the alarm: \(error.localizedDescription)")
//        }
        print("update alarm: \(alarm)")
    }
    
    func deleteAlarm(_ alarm: Alarm) {
        // Delete an alarm from Firestore
        
        //            db.collection("alarms").document(id: String).delete() { err in
        //                        if let err = err {
        //                            print("Error removing alarm: \(err.localizedDescription)")
        //                        } else {
        //                            print("Alarm successfully removed!")
        //                        }
        //                    }
        //                }
    }
    
    
    
    
    
}
