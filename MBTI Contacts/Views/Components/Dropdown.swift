//
//  Dropdown.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 16/04/26.
//

import SwiftUI

struct Dropdown: View {
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
            Text(selection)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: 250, maxHeight: 10, alignment: .center)
                .padding()
                .background(Color.black)
                .cornerRadius(60)
        }
        .padding(.horizontal)
    }
}
