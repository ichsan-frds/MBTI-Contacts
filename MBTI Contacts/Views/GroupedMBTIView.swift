//
//  GroupedMBTIList.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI
import SwiftData

struct GroupedMBTIView: View {
    @Query private var users: [User]
    private var currentUser: User? {
        users.first
    }
    
    @State private var selectedGroup: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    @State private var contacts: [Contact] = ContactSeeder.defaultContacts
    @State private var hasLoaded: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ForEach(MBTIData.mbtiGroups, id: \.self) { group in
                    Button(action: {
                        selectedGroup = group
                        if let firstMBTI = MBTIData.groups[group]?.first {
                            selectedMBTI = firstMBTI
                        }
                    }) {
                        Text(group)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 7)
                            .background(
                                selectedGroup == group
                                ? Color.white.opacity(0.6)
                                : Color.white.opacity(0.08)
                            )
                            .cornerRadius(50)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            TabView(selection: $selectedMBTI) {
                ForEach(MBTIData.groups[selectedGroup] ?? [], id: \.self) { mbti in
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            MBTIData.colors[mbti] ?? Color.purple,
                                            MBTIData.darkColors[mbti] ?? Color.purple.opacity(0.5)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(maxWidth: .infinity)
                                .frame(height: 540)
                            
                            let filteredContacts = contacts.filter { $0.mbti == mbti }
                            let groupedContacts = Dictionary(grouping: filteredContacts) {
                                String($0.firstName.prefix(1)).uppercased()
                            }
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text(mbti)
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.top, 20)
                                    .padding(.bottom, 8)
                                
                                if let user = currentUser, mbti == user.mbti {
                                    ContactRow(person: user)
                                    
                                    if !filteredContacts.isEmpty {
                                        Divider()
                                            .background(Color.white.opacity(0.15))
                                            .padding(.leading, 76)
                                    }
                                }
                                
                                if filteredContacts.isEmpty {
                                    Spacer()
                                    if currentUser?.mbti != mbti {
                                        Text("No \(mbti) contacts yet")
                                            .foregroundColor(.white.opacity(0.5))
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    Spacer()
                                } else {
                                    ScrollView {
                                        VStack(alignment: .leading, spacing: 0) {
                                            ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                                                HStack {
                                                    Text(letter)
                                                        .font(.footnote.bold())
                                                        .foregroundColor(.white.opacity(0.5))
                                                        .padding(.leading, 16)
                                                    Spacer()
                                                }
                                                .padding(.top, 12)
                                                .padding(.bottom, 4)
                                                
                                                Divider()
                                                    .background(Color.white.opacity(0.5))
                                                    .padding(.leading, 15)
                                                    .padding(.trailing, 20)
                                                
                                                ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                                    ContactRow(person: contact)
                                                }
                                            }
                                        }
                                        .padding(.top, 4)
                                    }
                                    .frame(maxHeight: .infinity)
                                }
                            }
                            .frame(height: 540)
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .tag(mbti)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(maxHeight: .infinity)
            .id(selectedGroup)
            
            HStack(spacing: 10) {
                NavigationLink(destination: SearchContactsView()) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.6))
                        Text("Search")
                            .foregroundColor(.white.opacity(0.6))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(30)
                }
                
                NavigationLink(destination: AddContactView()) {
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(14)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(999)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }
        .navigationTitle("MBTI Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if !hasLoaded {
                if let userMBTI = currentUser?.mbti {
                    selectedMBTI = userMBTI
                    selectedGroup = MBTIData.mbtiToGroup[userMBTI] ?? "Analyst"
                }
                hasLoaded = true
            }
        }
        .onChange(of: currentUser?.mbti) { oldValue, newValue in
            if let newMBTI = newValue, oldValue != newValue {
                selectedGroup = MBTIData.mbtiToGroup[newMBTI] ?? "Analyst"
                selectedMBTI = newMBTI
            }
        }
    }
}

#Preview {
    NavigationStack {
        GroupedMBTIView()
    }
}
