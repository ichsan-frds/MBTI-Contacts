//
//  UserDescriptionView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 17/04/26.
//

import SwiftUI

struct UserDescriptionView: View {
    let selectedMBTI: String
    @Environment(\.dismiss) private var dismiss
    @State private var textInput: String = ""
    
    let maxTextLength: Int = 100
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: For Layouting when Debugging - COMMENT IN PROD
                Spacer()
                Text("Describe Yourself in One Sentence")
                    .font(Font.title.bold())
                    .multilineTextAlignment(.center)
//                    .padding(.top, 50)
                Spacer()
                TextEditor(text: $textInput)
                    .onChange(of: textInput) { oldValue, newValue in
                        if newValue.count > maxTextLength {
                            textInput = String(newValue.prefix(maxTextLength))
                        }
                    }
                    .frame(height: 200)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.gray, width: 1)
                    .padding(.horizontal, 50)
                Text("\(textInput.count) / \(maxTextLength)")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 50)
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    VStack {
                        Image(selectedMBTI)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        Text(selectedMBTI)
                            .font(.title3.bold())
                            .foregroundColor(.primary)
                    }
                }
                    .border(Color.black, width: 1)
                    .cornerRadius(3)
//                    .shadow(radius: 5)
                Spacer()
                NavigationLink(destination: ContentView()) {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    UserDescriptionView(selectedMBTI: "INTJ")
}
