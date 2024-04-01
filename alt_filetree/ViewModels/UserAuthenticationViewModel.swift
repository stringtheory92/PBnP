//
//  UserViewModel.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import Foundation


import Combine

class UserAuthenticationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    // ...other properties...
    
    private var authService = AuthenticationService.shared
    
    func signIn() {
        authService.signIn(withEmail: email, password: password) { result in
            switch result {
            case .success(let user):
                // Handle successful authentication
            case .failure(let error):
                // Handle error
            }
        }
    }
    
    func signUp() {
        authService.signUp(withEmail: email, password: password) { result in
            // ...similar handling...
        }
    }
    
    // ...other methods...
}
