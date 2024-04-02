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
//                        .autocapitalization(.none) <== look up later
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button(action: {
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
