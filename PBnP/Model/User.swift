//
//  User.swift
//  PBnP
//
//  Created by Adam Kabak on 4/2/24.
//

import Foundation

struct User: Identifiable, Codable { // Codable: Decodes incoming raw json into data that conforms to structure below
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Charles Mingus", email: "mingusmoves@gmail.com")
}
