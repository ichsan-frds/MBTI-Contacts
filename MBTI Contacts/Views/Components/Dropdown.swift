//
//  Dropdown.swift
//  MBTI Contacts
//
//  Created by Richard on 20/04/26.
//

import SwiftUI

struct Dropdown: View {
    // MARK: Binding = Passing by Reference
    @Binding var selection: String
    
    var body: some View {
        Menu {
            ForEach(MBTIData.mbtiGroups, id: \.self) { option in
                Button(option) {
                    selection = option
                }
            }
        } label: {
            HStack {
                Text(selection)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.primary)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(width: 250)
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(60)
        }
        .tint(.primary)
    }
}
