//
//  ContentView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 16/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var users: [User]
    
    var body: some View {
        if users.isEmpty {
            RegisterView()
        } else {
            NavigationStack {
                GroupedMBTIView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .modelContainer(for: [User.self, Contact.self], inMemory: true)
    }
}
