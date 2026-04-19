//
//  Contact.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 16/04/26.
//

import Foundation
import SwiftData

@Model
final class Contact {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var mbti: String
    var personDescription: String
    
    var timestamp: Date
    
    init(
        firstName: String,
        lastName: String = "",
        phoneNumber: String = "",
        mbti: String,
        personDescription: String,
        timestamp: Date = .now
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.mbti = mbti
        self.personDescription = personDescription
        self.timestamp = timestamp
    }
}
