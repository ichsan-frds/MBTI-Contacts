//
//  ContactDetailView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 19/04/26.
//

import SwiftUI

struct ContactDetailView: View {
    let contact: Contact

    var body: some View {
        VStack(spacing: 0) {

            TabView {
                ZStack {
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color.white.opacity(0.15))
                    Text("\(contact.firstName.prefix(1).uppercased())\(contact.lastName.prefix(1).uppercased())")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.white)
                }

                VStack(spacing: 12) {
                    Image(contact.mbti)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .clipShape(Circle())
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(width: 220, height: 240)
            .padding(.top, 20)
            .padding(.bottom, 10)

            ScrollView {
                VStack(spacing: 15) {
                    VStack(spacing: 10) {
                        Text("\(contact.firstName) \(contact.lastName)")
                            .font(.title.bold())
                            .foregroundColor(.white)

                        Text("\(contact.mbti)")
                            .font(.title2.bold())
                            .foregroundColor(MBTIData.colors[contact.mbti] ?? .secondary)
                    }
                    .padding(.bottom, 15)

                    HStack(spacing: 20) {
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color.white.opacity(0.1))
                            Image(systemName: "message").font(.system(size: 28)).foregroundColor(.white)
                        }
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color.white.opacity(0.1))
                            Image(systemName: "phone").font(.system(size: 28)).foregroundColor(.white)
                        }
                        ZStack {
                            Circle().frame(width: 70, height: 70).foregroundColor(Color.white.opacity(0.1))
                            Image(systemName: "video").font(.system(size: 28)).foregroundColor(.white)
                        }
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundStyle(Color(red: 1.0, green: 0.87, blue: 0.7))
                        Text("Compare MBTI")
                            .bold()
                            .foregroundColor(.black)
                    }
                    .frame(height: 65)
                    .padding(.horizontal, 50)
                    .padding(.bottom, 20)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Phone").bold().foregroundColor(.white)
                        Text(contact.phoneNumber).foregroundColor(.white.opacity(0.6))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Personality Description").bold().foregroundColor(.white)
                        Text(contact.personDescription)
                            .foregroundColor(.white.opacity(0.6))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(minHeight: 65)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))

                    Button(action: {
                        print("Delete tapped")
                    }) {
                        Text("Delete Contact")
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .frame(minHeight: 65)
                            .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(.red))
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
        .navigationTitle("Contact Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(contact: Contact(firstName: "Andres", lastName: "Iniesta", phoneNumber: "+6212345678990", mbti: "INTJ", personDescription: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision"))
    }
}
