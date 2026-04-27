//
//  Profile.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 22/04/26.
//

protocol Profile {
    var firstName: String { get }
    var lastName: String { get }
    var phoneNumber: String { get }
    var mbti: String { get }
    var desc: String { get }
}
