//
//  SearchContactsView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct SearchContactsView: View {
    var initialSearchText: String = ""

    @State private var contacts: [Contact] = ContactSeeder.defaultContacts
    @State private var searchText: String = ""
    
    @FocusState private var isSearchFocused: Bool
    
    var searchResults: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                let fullName = "\(contact.firstName) \(contact.lastName)"
                let matchesName = fullName.localizedCaseInsensitiveContains(searchText)
                let matchesMBTI = contact.mbti.localizedCaseInsensitiveContains(searchText)
                return matchesName || matchesMBTI
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            let groupedContacts = Dictionary(grouping: searchResults) {
                String($0.firstName.prefix(1)).uppercased()
            }
            
            if searchResults.isEmpty {
                Spacer()
                Text(searchText.isEmpty ? "No contacts yet" : "No results found")
                    .foregroundColor(.white.opacity(0.5))
                Spacer()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                            Section(header: HStack {
                                Text(letter)
                                    .font(.footnote.bold())
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.leading, 20)
                                Spacer()
                            }) {
                                Divider()
                                    .background(Color.white.opacity(0.2))
                                    .padding(.horizontal, 20)
                                
                                ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                    ContactRow(contact: contact, displayMbti: true, isDark: true)
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .frame(maxHeight: .infinity)
            }
            
            HStack(spacing: 12) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white.opacity(0.6))
                    TextField("Search", text: $searchText)
                        .foregroundColor(.white)
                        .tint(.white)
                        .autocorrectionDisabled()
                        .focused($isSearchFocused)
                    
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                }
                .padding(12)
                .background(Color.white.opacity(0.1))
                .cornerRadius(30)
                
                NavigationLink(destination: AddContactView()) {
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(15)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(999)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
        .navigationTitle("All Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear {
            searchText = initialSearchText
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isSearchFocused = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        SearchContactsView()
    }
}
