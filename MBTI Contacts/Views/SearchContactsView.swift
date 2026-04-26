//
//  SearchContactsView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI
import SwiftData

struct SearchContactsView: View {
    var initialSearchText: String = ""
    
    @Query private var contacts: [Contact]
    @Query private var users: [User]
    
    private var currentUser: User? {
        users.first
    }
    
    @State private var searchText: String = ""
    @State private var isShowingAddContactSheet = false
    
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
            
            let userMatchesSearch: Bool = {
                guard let user = currentUser else { return false }
                if searchText.isEmpty { return true }
                let fullName = "\(user.firstName) \(user.lastName)"
                return fullName.localizedCaseInsensitiveContains(searchText) ||
                user.mbti.localizedCaseInsensitiveContains(searchText)
            }()
            
            if searchResults.isEmpty && !userMatchesSearch {
                Spacer()
                Text(searchText.isEmpty ? "No contacts yet" : "No results found")
                    .foregroundColor(.white.opacity(0.5))
                Spacer()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        if let user = currentUser, userMatchesSearch {
                            ContactRow(person: user, displayMbti: true)
                            
                            if !searchResults.isEmpty {
                            }
                        }
                        
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
                                    ContactRow(person: contact, displayMbti: true)
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
                
                Button(action: {
                    if isSearchFocused {
                        searchText = ""
                        isSearchFocused = false
                        
                    } else {
                        isShowingAddContactSheet = true
                    }
                }) {
                    Image(systemName: isSearchFocused ? "xmark" : "plus")
                        .font(.title3.bold())
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(14)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(999)
                        .contentTransition(.symbolEffect(.replace))
                }
                .sheet(isPresented: $isShowingAddContactSheet) {
                    AddContact()
                        .presentationDetents([.fraction(0.3)])
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
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contact.self, User.self, configurations: config)
    
    for contact in ContactSeeder.defaultContacts {
        container.mainContext.insert(contact)
    }
    
    return NavigationStack {
        SearchContactsView()
    }
    .modelContainer(container)
}
