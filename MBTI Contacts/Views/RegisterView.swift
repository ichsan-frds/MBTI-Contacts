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
                                .foregroundStyle(MBTIData.groupColors[mbti] ?? .primary)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(maxHeight: 290)
                
                Spacer()
                
                VStack() {
                    TextField("", text: $firstName, prompt: Text("First Name").foregroundColor(.secondary))
                        .padding(.vertical, 10).foregroundColor(.primary)
                    
                    Divider()
                        .background(Color.secondary.opacity(0.5))
                    
                    TextField("", text: $lastName, prompt: Text("Last Name").foregroundColor(.secondary))
                        .padding(.vertical, 10).foregroundColor(.primary)
                    
                    Divider()
                        .background(Color.secondary.opacity(0.5))
                    
                    TextField("", text: $phoneNumber, prompt: Text("Phone Number").foregroundColor(.secondary))
                        .padding(.vertical, 10).foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("FormBackground"))
                )
                .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: ChooseMBTIView(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty ? Color.secondary : Color.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty ? Color(UIColor.systemGray2) : Color(red: 1.0, green: 0.87, blue: 0.7))
                        .cornerRadius(12)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty)
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AppBackground").ignoresSafeArea())
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

#Preview {
    RegisterView()
}
