//
//  ContactRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact?
    var user: User?
    
    var isUser: Bool = false
    var displayMbti: Bool = false
    
    private var firstName: String {
        contact?.firstName ?? user?.firstName ?? ""
    }
    
    private var lastName: String {
        contact?.lastName ?? user?.lastName ?? ""
    }
    
    private var mbtiValue: String {
        contact?.mbti ?? user?.mbti ?? ""
    }
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            HStack(spacing: 14) {
                
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 46, height: 46)
                    Text("\(firstName.prefix(1).uppercased())\(lastName.prefix(1).uppercased())")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }

                if isUser {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(firstName) \(lastName)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("My Profile")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.55))
                    }
                    Spacer()
                    
                } else {
                    
                    Text("\(firstName) \(lastName)")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    if displayMbti {
                        Spacer()
                        Text(mbtiValue)
                            .font(.headline.bold())
                            .foregroundColor(.secondary)
                    } else {
                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        
        if !isUser {
            Divider()
                .background(Color.white.opacity(0.5))
                .padding(.leading, 76)
                .padding(.trailing, 20)
        }
    }
    
    @ViewBuilder
    private var destinationView: some View {
        if let contact = contact {
            ContactDetailView(contact: contact)
        } else if let user = user {
            Text("User Profile View for \(user.firstName)")
        } else {
            EmptyView()
        }
    }
}
