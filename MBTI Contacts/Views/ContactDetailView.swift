//
//  ContactDetailView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactDetailView: View {
    let contact: Contact
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color(.systemGray6))
                Text("\(contact.firstName.prefix(1).uppercased())\(contact.lastName.prefix(1).uppercased())")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.top, 20)
            .padding(.bottom, 30)
            
            ScrollView {
                VStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Text("\(contact.firstName) \(contact.lastName)")
                            .font(.title.bold())
                        
                        Text("\(contact.mbti)")
                            .font(.title2.bold())
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 15)
                    
                    HStack(spacing: 20) {
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color(.systemGray6))
                            Image(systemName: "message").font(.system(size: 28))
                        }
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color(.systemGray6))
                            Image(systemName: "phone").font(.system(size: 28))
                        }
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color(.systemGray6))
                            Image(systemName: "video").font(.system(size: 28))
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(Color.orange.opacity(0.2))
                        Text("Compare MBTI")
                            .bold()
                    }
                    .frame(height: 65)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Phone").bold().foregroundStyle(.primary)
                        Text(contact.phoneNumber).foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color(.systemGray6)))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("One Sentence Description").bold().foregroundStyle(.primary)
                        Text(contact.personDescription)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color(.systemGray6)))
                    
                    Button(action: {
                        print("Delete tapped")
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
                .padding(.horizontal, 30)C
//                .padding(.bottom, 40)
            }
        }
        .navigationTitle("Contact Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(contact: Contact(firstName: "Andres",  lastName: "Iniesta", phoneNumber: "+6212345678990", mbti: "INTJ", personDescription: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision"))
    }
}
