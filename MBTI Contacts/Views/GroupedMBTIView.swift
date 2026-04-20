//
//  GroupedMBTIList.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct GroupedMBTIView : View {
    @State private var selectedGroup: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    @State private var contacts: [Contact] = ContactSeeder.defaultContacts
    
    let mbtiGroups : [String] = ["Analyst", "Diplomats", "Sentinels", "Explorers"]
    let mbtiGroupsMap: [String: [String]] = [
            "Analyst": ["INTJ", "INTP", "ENTJ", "ENTP"],
            "Diplomats": ["INFJ", "INFP", "ENFJ", "ENFP"],
            "Sentinels": ["ISTJ", "ISFJ", "ESTJ", "ESFJ"],
            "Explorers": ["ISTP", "ISFP", "ESTP", "ESFP"]
        ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("MBTI Contacts")
                    .font(.title3.bold())
                    .padding(.top, 20)
                
                HStack {
                    ForEach(mbtiGroups, id: \.self) { group in
                        Button(action: {
                            selectedGroup = group
//                            if let firstMBTI = mbtiGroupsMap[group]?.first {
//                                selectedMBTI = firstMBTI
//                            }
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(selectedGroup == group ? Color.black : Color.secondary)
                                    .frame(width: 88, height: 27)
                                    .cornerRadius(50)
                                Text(group)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
//                .padding(.horizontal, 10)
//                .padding(.bottom, 10)
                
                TabView(selection: $selectedMBTI) {
                    ForEach(mbtiGroupsMap[selectedGroup] ?? [], id: \.self) { mbti in
                        VStack(alignment: .leading) {
                            Text(mbti)
                                .font(.title3.bold())
                                                
                             ZStack {
                                 // MARK: UNCOMMENT FOR STACKING PAPER ILLUSION
//                                 RoundedRectangle(cornerRadius: 25)
//                                     .fill(Color.white.opacity(0.4))
//                                     .frame(height: 550)
//                                     .offset(x: 20, y: 20)
//                                                    
//                                 RoundedRectangle(cornerRadius: 25)
//                                     .fill(Color.white)
//                                     .frame(height: 550)
//                                     .offset(x: 10, y: 10)
                                                    
                                 ZStack {
                                     RoundedRectangle(cornerRadius: 25)
                                         .fill(Color.white)
                                         .frame(height: 500)
                                         .shadow(color: Color.gray.opacity(0.3), radius: 10)
                                     
                                     let filteredContacts = contacts.filter { $0.mbti == mbti }
                                     let groupedContacts = Dictionary(grouping: filteredContacts) {
                                         String($0.firstName.prefix(1)).uppercased()
                                     }
                                     
                                     if filteredContacts.isEmpty {
                                         Text("No \(mbti) contacts yet")
                                             .foregroundColor(.gray)
                                     } else {
                                         ScrollView {
                                             VStack(alignment: .leading, spacing: 10) {
                                                 ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                                                     Section(header: HStack {
                                                         Text(letter)
                                                             .font(.footnote.bold())
                                                             .foregroundColor(.secondary)
                                                             .padding(.leading, 10)
                                                         Spacer()
                                                     }) {
                                                         ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                                             Divider()
                                                                 .padding(.horizontal, 10)
                                                             ContactRow(contact: contact)
                                                         }
                                                     }
                                                 }
                                             }
                                             .padding(.top, 10)
                                         }
                                         .frame(height: 500)
                                     }
                                 }
                             }
                            Spacer()
                        }
                            .padding(.horizontal, 20)
                            .tag(mbti)
                    }
                }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
//                    .frame(maxHeight: .infinity, alignment: .top)
                
//                Spacer()
                
                HStack(spacing: 10) {
                    NavigationLink(destination: SearchContactsView()) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("Search")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                    }
                    
                    Button(action: {
                        print("Add Contact Sheet")
                    }) {
                        Image(systemName: "plus")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                            .padding(15)
                            .background(Color.white)
                            .cornerRadius(999)
                            .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 10)
            }
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    GroupedMBTIView()
}
