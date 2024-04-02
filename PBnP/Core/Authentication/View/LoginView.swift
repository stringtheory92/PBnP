//
//  LoginView.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import Foundation
import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("PBnP_banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .padding(.bottom, 100)
                
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none) // <== look up later
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button(action: {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                    
                    print("Log user in...")
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding(140)
                    .frame(height: 48)
                        
                })
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
            Spacer()
                
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.bold)
                    
                }
                .font(.system(size: 14))
            }
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
