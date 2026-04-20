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
    
    var body: some View {
        NavigationLink(destination: ContactDetailView(contact: contact)) {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(.systemGray6))
                    Text("\(contact.firstName.prefix(1).uppercased())\(contact.lastName.prefix(1).uppercased())")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    
                    HStack {
                        Text("\(contact.firstName) \(contact.lastName)")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        if displayMbti {
                            Spacer()
                            Text(contact.mbti)
                                .font(.headline.bold())
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    // MARK: UNCOMMENT TO ADD DESCRIPTION
                    //                        Text(contact.personDescription)
                    //                    .font(.system(size: 12))
                    //                    .foregroundColor(.secondary)
                    //                    .lineLimit(2)
                    //                    .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Divider()
                        .padding(.top, 5)
                }
            }
            .padding(.horizontal)
            .cornerRadius(25)
        }
    }
}
