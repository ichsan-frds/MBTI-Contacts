//
//  ContactRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactRow: View {
    var person: any Profile
    
    // MARK: Used in SearchContactsView
    var displayMbti: Bool = false
    // MARK: Used in GroupedMBTIView, Make sure Text still appear in white whether it's Light or Dark mode
    var useWhiteText: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationLink(destination: ContactDetailView(person: person)) {
            HStack(spacing: 14) {
                
                ZStack {
                    Circle()
                        .fill(Color.primary.opacity(0.1))
                        .frame(width: 46, height: 46)
                    Text("\(person.firstName.prefix(1).uppercased())\(person.lastName.prefix(1).uppercased())")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(useWhiteText ? .white : .primary)
                }
                
                if person is User {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(person.firstName) \(person.lastName)")
                            .font(.headline)
                            .foregroundColor(useWhiteText ? .white : .primary)
                        
                        Text("My Profile")
                            .font(.caption)
                            .foregroundColor(useWhiteText ? .white.opacity(0.6) : .secondary)
                    }
                    Spacer()
                    
                } else {
                    Text("\(person.firstName) \(person.lastName)")
                        .font(.headline)
                        .foregroundColor(useWhiteText ? .white : .primary)
                    
                    if displayMbti {
                        Spacer()
                        Text(person.mbti)
                            .font(.headline.bold())
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    MBTIData.colors[person.mbti] ?? Color.purple,
                                    colorScheme == .dark
                                    ? (MBTIData.darkColors[person.mbti] ?? Color.purple.opacity(0.5))
                                    : (MBTIData.colors[person.mbti]?.opacity(0.6) ?? Color.purple.opacity(0.6))
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                    } else {
                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        
        if person is Contact {
            Divider()
                .background(Color.primary.opacity(0.15))
                .padding(.leading, 76)
                .padding(.trailing, 20)
        }
    }
}
