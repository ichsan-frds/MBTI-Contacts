//
//  ContactRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ContactView(contact: contact)) {
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
                        
                        Text("\(contact.firstName) \(contact.lastName)")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        // MARK: UNCOMMENT TO ADD DESCRIPTION
                        //                Text(contact.personDescription)
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
                .background(Color.white)
                .cornerRadius(25)
            }
        }
    }
}
