//
//  ContactRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    var displayMbti: Bool = false
    var isDark: Bool = false
    
    var body: some View {
        NavigationLink(destination: ContactDetailView(contact: contact)) {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(isDark ? Color.white.opacity(0.15) : Color(.systemGray6))
                    Text("\(contact.firstName.prefix(1).uppercased())\(contact.lastName.prefix(1).uppercased())")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(isDark ? .white : .black)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    
                    HStack {
                        Text("\(contact.firstName) \(contact.lastName)")
                            .font(.headline)
                            .foregroundColor(isDark ? .white : .black)
                        
                        if displayMbti {
                            Spacer()
                            Text(contact.mbti)
                                .font(.headline.bold())
                                .foregroundColor(MBTIData.colors[contact.mbti] ?? .secondary)
                        }
                    }
                    
                    Spacer()
                    
                    Divider()
                        .background(isDark ? Color.white.opacity(0.15) : Color.gray.opacity(0.3))
                        .padding(.top, 5)
                }
            }
            .padding(.horizontal)
            .cornerRadius(25)
        }
    }
}
