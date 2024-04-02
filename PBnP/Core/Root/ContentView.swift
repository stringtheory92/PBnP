//
//  ContentView.swift
//  PBnP
//
//  Created by Adam Kabak on 4/1/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
//                ProfileView()
                ClockHome()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
