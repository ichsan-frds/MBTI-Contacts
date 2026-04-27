//
//  User.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 21/04/26.
//

import Foundation
import SwiftData

@Model
final class User: Profile {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var mbti: String
    var desc: String
    
    var timestamp: Date
    
    init(
        firstName: String,
        lastName: String = "",
        phoneNumber: String = "",
        mbti: String,
        desc: String,
        timestamp: Date = .now
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.mbti = mbti
        self.desc = desc
        self.timestamp = timestamp
    }
}
