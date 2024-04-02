//
//  Alarm.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import Foundation


struct Alarm: Identifiable, Codable {
    var id: String = UUID().uuidString
    var userId: String
    var time: Date
    var label: String
    var isEnabled: Bool = true
    var repeatSchedule: RepeatSchedule
}

enum RepeatSchedule: String, Codable {
    case none
    case daily
    case weekly
}

// test alarm for development
extension Alarm {
    static func createMockAlarm(forUserId userId: String) -> Alarm {
        return Alarm(userId: userId,
                     time: Date().addingTimeInterval(60), // Current time + 1 minute
                     label: "Test Alarm",
                     isEnabled: true,
                     repeatSchedule: .none)
    }
}
