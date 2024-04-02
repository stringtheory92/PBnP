//
//  AuthViewModel.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // (firebase auth user) tells app whether or not there is a user logged in, to direct to login flow or profile view
    @Published var currentUser: User? // user obj in app
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws { // lookup async throws - YT: AppStuff Async/AwaitNavigation Stacks
        
    }
    
    func createUser(withEmail email: String, passoword: String, fullname: String) async throws {
        
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
    
}
