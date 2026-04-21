//
//  RegisterView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 21/04/26.
//

import SwiftUI

struct RegisterView : View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    
    var body : some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TabView() {
                    ForEach(MBTIData.mbtiGroups, id: \.self) { mbti in
                        VStack(spacing: 20) {
                            Image(mbti)
                            Text(mbti)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(MBTIData.groupColors[mbti] ?? .white)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(maxHeight: 290)
                
                Spacer()
                
                VStack() {
                    TextField("", text: $firstName, prompt: Text("First Name").foregroundColor(.white.opacity(0.6)))
                        .padding(.vertical, 10)
                    
                    Divider()
                        .background(Color.gray.opacity(0.6))
                    
                    TextField("", text: $lastName, prompt: Text("Last Name").foregroundColor(.white.opacity(0.6)))
                        .padding(.vertical, 10)
                    
                    Divider()
                        .background(Color.gray.opacity(0.6))
                    
                    TextField("", text: $phoneNumber, prompt: Text("Phone Number").foregroundColor(.white.opacity(0.6)))
                        .padding(.vertical, 10)
                        .keyboardType(.phonePad)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black)
                )
                .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.16, green: 0.16, blue: 0.18)
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    RegisterView()
}
