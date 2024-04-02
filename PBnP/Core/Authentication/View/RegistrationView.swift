//
//  RegistrationView.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import Foundation
import SwiftUI


struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("PBnP_banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .padding(.bottom, 100)
                
                VStack(spacing: 24) {
                    InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
//                        .autocapitalization(.none) <== look up later
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button(action: {
                    print("Sign user up...")
                }, label: {
                    HStack {
                        Text("SIGN UP")
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
                
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                    
                }
                .font(.system(size: 14))
            }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

