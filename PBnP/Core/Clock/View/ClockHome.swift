//
//  Main.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import Foundation
import SwiftUI

struct ClockHome: View {
    @EnvironmentObject var viewModel: AuthViewModel
    // Since we're only updating every minute, we can use a TimeInterval of 60 seconds
        let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

        // Computed property for the current time
        var currentTime: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: Date())
        }
    var body: some View {
        Text(currentTime)
                   .onReceive(timer) { _ in
                       // No need to do anything here since `currentTime` is computed
                       // and the view will refresh when it changes
                   }
    }
}

struct ClockHome_Previews: PreviewProvider {
    static var previews: some View{
        ClockHome()
    }
}
