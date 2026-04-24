//
//  UserDescriptionView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 18/04/26.
//

import SwiftUI
import SwiftData

struct UserDescriptionView: View {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let mbti: String
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var textInput: String = ""
    
    let maxTextLength: Int = 100
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Describe Yourself in One Sentence")
                .font(.title.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer()
            
            TextEditor(text: $textInput)
                .onChange(of: textInput) { oldValue, newValue in
                    if newValue.count > maxTextLength {
                        textInput = String(newValue.prefix(maxTextLength))
                    }
                }
                .frame(height: 170)
                .scrollContentBackground(.hidden)
                .background(Color(red: 0.13, green: 0.13, blue: 0.15))
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                .padding(.horizontal, 30)
            
            Text("\(textInput.count)/\(maxTextLength)")
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 30)
                .padding(.top, 6)
            
            Spacer()
            
            VStack(spacing: 8) {
                Image(mbti)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text(mbti)
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button(action: saveUser) {
                Text("Save")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(textInput.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(12)
            }
            .disabled(textInput.isEmpty)
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private func saveUser() {
        let newUser = User(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            mbti: mbti,
            desc: textInput
        )
        modelContext.insert(newUser)
    }
}


#Preview {
    UserDescriptionView(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6285959808110", mbti: "INTJ")
}
