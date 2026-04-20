//
//  SearchContactsView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct SearchContactsView: View {
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
                    .foregroundColor(.gray)
                Spacer()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                            Section(header: HStack {
                                Text(letter)
                                    .font(.footnote.bold())
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 20)
                                Spacer()
                            }) {
                                Divider()
                                    .padding(.horizontal, 20)
                                
                                ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                    ContactRow(contact: contact, displayMbti: true)
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
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .autocorrectionDisabled()
                        .focused($isSearchFocused)
                    
                    if !searchText.isEmpty {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(12)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                
                NavigationLink(destination: AddContactView()) {
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundColor(.black)
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(999)
                        .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("All Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
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
