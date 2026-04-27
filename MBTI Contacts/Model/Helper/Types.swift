//
//  Types.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 27/04/26.
//

// MARK: Temp var for saving user profile changes before actually updating the SwiftData
struct ProfileDraft {
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var mbti: String = "ENFP"
    var desc: String = ""

    init(from user: User? = nil) {
        if let user = user {
            self.firstName = user.firstName
            self.lastName = user.lastName
            self.phoneNumber = user.phoneNumber
            self.desc = user.desc
            self.mbti = user.mbti
        }
    }
}
