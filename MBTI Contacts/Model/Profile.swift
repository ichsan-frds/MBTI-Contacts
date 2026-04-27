//
//  Profile.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 22/04/26.
//

// MARK: Blueprint for User and Profile properties to follow
// Used by View so it can accept both Contact or User as params
protocol Profile {
    var firstName: String { get }
    var lastName: String { get }
    var phoneNumber: String { get }
    var mbti: String { get }
    var desc: String { get }
}
