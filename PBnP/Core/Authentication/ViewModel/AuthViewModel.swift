//
//  AuthViewModel.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    // Published properties make another call to ContentView (trigger conditional render of profile view when session is created)
    @Published var userSession: FirebaseAuth.User? // (firebase auth user) tells app whether or not there is a user logged in, to direct to login flow or profile view
    @Published var currentUser: User? // user obj in app
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws { // lookup async throws - YT: AppStuff Async/AwaitNavigation Stacks
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws { // async func that can throw an error (hence the do/catch)
        print("Create user..")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password) // await attempt to create new firebase user
            self.userSession = result.user                                                        // if we get the result, set userSession property (line 13)
            let user = User(id: result.user.uid, fullname: fullname, email: email)              // create our user instance with additional properies defined by User model
            let encodedUser = try Firestore.Encoder().encode(user)                              // encode that user instance
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) // add the new user instance (with additional properties) to firestore
            
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        // could implement do/catch for getting document. no big deal for now
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return } // .getDocument returns a snapshot
        self.currentUser = try? snapshot.data(as: User.self) // setting User property defined as Published above
        
        print("DEBUG: current user is \(self.currentUser)")
    }
    
}
