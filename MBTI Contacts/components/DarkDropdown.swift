//
//  DarkDropdown.swift
//  MBTI Contacts
//
//  Created by Richard on 20/04/26.
//

import SwiftUI

struct DarkDropdown: View {
    @Binding var selection: String
    let options = ["Analyst", "Diplomats", "Sentinels", "Explorers"]
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selection = option
                }
            }
        } label: {
            HStack {
                Text(selection)
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                Text("v")
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(width: 250)
            .background(Color.white.opacity(0.15))
            .cornerRadius(60)
        }
    }
}
