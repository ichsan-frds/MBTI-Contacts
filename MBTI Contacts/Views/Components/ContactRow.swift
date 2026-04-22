//
//  ContactRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactRow: View {
    var person: any Profile
    
    var displayMbti: Bool = false
    
    var body: some View {
        NavigationLink(destination: ContactDetailView(person: person)) {
            HStack(spacing: 14) {
                
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.25))
                        .frame(width: 46, height: 46)
                    Text("\(person.firstName.prefix(1).uppercased())\(person.lastName.prefix(1).uppercased())")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }

                if person is User {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(person.firstName) \(person.lastName)")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("My Profile")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.55))
                    }
                    Spacer()
                    
                } else {
                    
                    Text("\(person.firstName) \(person.lastName)")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    if displayMbti {
                        Spacer()
                        Text(person.mbti)
                            .font(.headline.bold())
                            .foregroundStyle(LinearGradient(
                                colors: [
                                    MBTIData.colors[person.mbti] ?? Color.purple,
                                    MBTIData.darkColors[person.mbti] ?? Color.purple.opacity(0.5)
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
                .background(Color.white.opacity(0.5))
                .padding(.leading, 76)
                .padding(.trailing, 20)
        }
    }
}
