//
//  ContactDetailView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI
import SwiftData

struct ContactDetailView: View {
    let person: any Profile
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TabView {
                    ZStack {
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color.primary.opacity(0.1))
                        Text("\(person.firstName.prefix(1).uppercased())\(person.lastName.prefix(1).uppercased())")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    
                    VStack(spacing: 12) {
                        Image(person.mbti)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)
                            .clipShape(Circle())
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(width: 220, height: 240)
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                VStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Text("\(person.firstName) \(person.lastName)")
                            .font(.title.bold())
                            .foregroundColor(.primary)
                        
                        Text("\(person.mbti)")
                            .font(.title2.bold())
                            .foregroundColor(MBTIData.colors[person.mbti] ?? .primary)
                    }
                    .padding(.bottom, 15)
                    
                    if let contact = person as? Contact {
                        HStack(spacing: 20) {
                            ZStack {
                                Circle().frame(width: 70, height: 70).foregroundColor(Color.primary.opacity(0.1))
                                Image(systemName: "message").font(.system(size: 28)).foregroundColor(.primary)
                            }
                            ZStack {
                                Circle().frame(width: 70, height: 70).foregroundColor(Color.primary.opacity(0.1))
                                Image(systemName: "phone").font(.system(size: 28)).foregroundColor(.primary)
                            }
                            ZStack {
                                Circle().frame(width: 70, height: 70).foregroundColor(Color.primary.opacity(0.1))
                                Image(systemName: "video").font(.system(size: 28)).foregroundColor(.primary)
                            }
                        }
                        
                        NavigationLink(destination: CompareMBTIView(contact: contact)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(Color(red: 1.0, green: 0.87, blue: 0.7))
                                Text("Compare MBTI")
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            .frame(height: 65)
                            .padding(.horizontal, 50)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    if person is User {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("First Name").bold().foregroundColor(.primary)
                            Text(person.firstName).foregroundColor(.secondary)
                            
                            Divider().background(Color.primary.opacity(0.15))
                            
                            Text("Last Name").bold().foregroundColor(.primary)
                            Text(person.lastName).foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.primary.opacity(0.05)))
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Phone").bold().foregroundColor(.primary)
                        Text(person.phoneNumber).foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.primary.opacity(0.05)))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Personality Description").bold().foregroundColor(.primary)
                        Text(person.desc)
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.primary.opacity(0.05)))
                    
                    if person is Contact {
                        Button(action: {
                            if let contactToDelete = person as? Contact {
                                modelContext.delete(contactToDelete)
                                
                                dismiss()
                            }
                        }) {
                            Text("Delete Contact")
                                .bold()
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 15)
                                .frame(minHeight: 65)
                                .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(.red))
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("AppBackground")
                .ignoresSafeArea()
        )
        .navigationTitle("Contact Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if let user = person as? User {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EditProfileView(user: user)) {
                        Image(systemName: "pencil")
                            .foregroundColor(.primary)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview ("Contact") {
    NavigationStack {
        ContactDetailView(
            person: Contact(firstName: "Andres", lastName: "Iniesta", phoneNumber: "+6212345678990", mbti: "INTJ", desc: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision")
        )
    }
}

#Preview ("User") {
    NavigationStack {
        ContactDetailView(
            person: User(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6212345678990", mbti: "INTJ", desc: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision")
        )
    }
}
