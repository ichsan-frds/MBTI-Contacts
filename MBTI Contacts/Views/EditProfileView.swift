//
//  EditProfileView.swift
//  MBTI Contacts
//
//  Created by Richard on 21/04/26.
//

import SwiftUI
import SwiftData

struct EditProfileView: View {
    let user: User
    @State private var draft = ProfileDraft()
    @State private var hasLoaded = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TabView {
                    ZStack {
                        Circle()
                            .frame(width: 160, height: 160)
                            .foregroundColor(Color.primary.opacity(0.1))
                        Text("\(draft.firstName.prefix(1).uppercased())\(draft.lastName.prefix(1).uppercased())")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    
                    Image(draft.mbti)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(width: 180, height: 200)
                .padding(.top, 20)
                
                VStack(spacing: 4) {
                    Text(draft.firstName)
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                    Text(draft.mbti)
                        .font(.headline)
                        .foregroundColor(MBTIData.colors[draft.mbti] ?? .secondary)
                }
                .padding(.top, 12)
                .padding(.bottom, 16)
                
                HStack(spacing: 12) {
                    NavigationLink(destination: ChooseMBTIView(editmbtiBinding: $draft.mbti)) {
                        Text("Change MBTI")
                            .font(.headline.bold())
                            .foregroundColor(.black)
                            .padding(.horizontal, 25)
                            .padding(.vertical, 15)
                            .background(Color(red: 1.0, green: 0.87, blue: 0.7))
                            .cornerRadius(999)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 20)
                
                VStack(spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("First name", text: $draft.firstName)
                            .foregroundColor(.primary)
                            .tint(.primary)
                        
                        Divider().background(Color.primary.opacity(0.15))
                        
                        TextField("Last name", text: $draft.lastName)
                            .foregroundColor(.primary)
                            .tint(.primary)
                        
                        Divider().background(Color.primary.opacity(0.15))
                        
                        TextField("Phone", text: $draft.phoneNumber)
                            .foregroundColor(.primary)
                            .tint(.primary)
                            .keyboardType(.phonePad)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.primary.opacity(0.05)))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Personality Description")
                            .font(.subheadline.bold())
                            .foregroundColor(.primary)
                        
                        TextField("Type how you as a person here", text: $draft.desc, axis: .vertical)
                            .foregroundColor(.secondary)
                            .tint(.primary)
                            .lineLimit(3...6)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.primary.opacity(0.05)))
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("AppBackground")
                .ignoresSafeArea()
        )
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    user.firstName = draft.firstName
                    user.lastName = draft.lastName
                    user.phoneNumber = draft.phoneNumber
                    user.mbti = draft.mbti
                    user.desc = draft.desc
                    
                    try? modelContext.save()
                    dismiss()
                }) {
                    Image(systemName: "checkmark")
                        .font(.body.bold())
                        .foregroundColor(.blue)
                }
            }
        }
        .onAppear {
            if !hasLoaded {
                draft = ProfileDraft(from: user)
                hasLoaded = true
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileView(
            user: User(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6212345678990", mbti: "ENFP", desc: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision")
        )
    }
}
