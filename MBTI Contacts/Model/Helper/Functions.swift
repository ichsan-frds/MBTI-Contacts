//
//  Utils.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 24/04/26.
//

import SwiftUI

// MARK: Force the keyboard to dissapear
func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
