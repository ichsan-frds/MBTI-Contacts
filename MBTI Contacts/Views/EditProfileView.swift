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
        VStack(spacing: 0) {
            
            TabView {
                ZStack {
                    Circle()
                        .frame(width: 160, height: 160)
                        .foregroundColor(Color.white.opacity(0.15))
                    Text("\(user.firstName.prefix(1).uppercased())\(user.lastName.prefix(1).uppercased())")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)
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
                    .foregroundColor(.white)
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
                //                        .foregroundColor(.white)
                //                        .padding(.horizontal, 20)
                //                        .padding(.vertical, 10)
                //                        .background(Color.white.opacity(0.2))
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
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("First name", text: $user.firstName)
                            .foregroundColor(.white)
                            .tint(.white)
                        Divider().background(Color.white.opacity(0.3))
                        TextField("Last name", text: $user.lastName)
                            .foregroundColor(.white)
                            .tint(.white)
                        Divider().background(Color.white.opacity(0.3))
                        TextField("Phone", text: $user.phoneNumber)
                            .foregroundColor(.white)
                            .tint(.white)
                            .keyboardType(.phonePad)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Personality Description")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                        TextField("Type how you as a person here", text: $user.desc, axis: .vertical)
                            .foregroundColor(.white.opacity(0.6))
                            .tint(.white)
                            .lineLimit(3...6)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    try? modelContext.save()
                    dismiss()
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
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
