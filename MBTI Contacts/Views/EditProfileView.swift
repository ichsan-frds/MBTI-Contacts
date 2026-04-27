//
//  EditProfileView.swift
//  MBTI Contacts
//
//  Created by Richard on 21/04/26.
//

import SwiftUI
import SwiftData

struct EditProfileView: View {
    @Bindable var user: User
    
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
                        Text("\(user.firstName.prefix(1).uppercased())\(user.lastName.prefix(1).uppercased())")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    
                    Image(user.mbti)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(width: 180, height: 200)
                .padding(.top, 20)
                
                VStack(spacing: 4) {
                    Text(user.firstName)
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                    Text(user.mbti)
                        .font(.headline)
                        .foregroundColor(MBTIData.colors[user.mbti] ?? .secondary)
                }
                .padding(.top, 12)
                .padding(.bottom, 16)
                
                HStack(spacing: 12) {
                    // TODO: (OPTIONAL) Edit Contact Model Schema so User can Edit Photo
                    //                Button(action: {
                    //                    print("Edit Photo tapped")
                    //                }) {
                    //                    Text("Edit Photo")
                    //                        .font(.subheadline.bold())
                    //                        .foregroundColor(.primary) // Adaptive
                    //                        .padding(.horizontal, 20)
                    //                        .padding(.vertical, 10)
                    //                        .background(Color.primary.opacity(0.1)) // Adaptive
                    //                        .cornerRadius(999)
                    //                }
                    
                    NavigationLink(destination: ChooseMBTIView(editmbtiBinding: $user.mbti)) {
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
                        TextField("First name", text: $user.firstName)
                            .foregroundColor(.primary)
                            .tint(.primary)
                        
                        Divider().background(Color.primary.opacity(0.15))
                        
                        TextField("Last name", text: $user.lastName)
                            .foregroundColor(.primary)
                            .tint(.primary)
                        
                        Divider().background(Color.primary.opacity(0.15))
                        
                        TextField("Phone", text: $user.phoneNumber)
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
                        
                        TextField("Type how you as a person here", text: $user.desc, axis: .vertical)
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
                    try? modelContext.save()
                    dismiss()
                }) {
                    Image(systemName: "checkmark")
                        .font(.body.bold())
                        .foregroundColor(.blue)
                }
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
            user: User(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6212345678990", mbti: "INTJ", desc: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision")
        )
    }
}
