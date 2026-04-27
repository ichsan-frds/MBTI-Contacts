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
    
    // MARK: Var to make sure all the form elements have been filled
    private var isFormValid: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty
    }
    
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
                            // MARK: Example of calling var from Helper
                                .foregroundStyle(MBTIData.groupColors[mbti] ?? .primary)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(maxHeight: 290)
                
                Spacer()
                
                VStack() {
                    // MARK: Dynamic Light Dark Mode
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
                
                // MARK: Props Drilling
                NavigationLink(destination: ChooseMBTIView(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(isFormValid ? Color.black : Color.secondary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color(red: 1.0, green: 0.87, blue: 0.7) : Color(UIColor.systemGray2))
                        .cornerRadius(12)
                }
                // MARK: Guard Next Button in Front-End
                .disabled(!isFormValid)
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // MARK: Dynamic Light Dark Mode from Assets Color Set
            .background(Color("AppBackground").ignoresSafeArea())
            // MARK: Click anywhere to dismiss
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

#Preview {
    RegisterView()
}
