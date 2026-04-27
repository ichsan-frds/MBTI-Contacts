//
//  ChooseMBTIView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 17/04/26.
//

import SwiftUI

struct ChooseMBTIView: View {
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    
    // MARK: Binding = Passing by Reference
    // ? / Optional = Data type can be other than Binding, because Binding always expect a parameter referenced from Parent
    // Default Value "nil" = Optional Parameter (supported by the Optional Binding
    var editmbtiBinding: Binding<String>? = nil
    
    @State private var selectedCategory: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    
    // MARK: Function to Back or Close from a .navigationLink or .sheet
    @Environment(\.dismiss) private var dismiss
    // MARK: Variable that tells whether the iPhone is in Light or Dark Mode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Dropdown(selection: $selectedCategory)
                .padding(.top, 10)
                .padding(.bottom, 20)
                .onChange(of: selectedCategory) { oldValue, newValue in
                    if let firstMBTI = MBTIData.groups[newValue]?.first {
                        selectedMBTI = firstMBTI
                    }
                }
            
            TabView(selection: $selectedMBTI) {
                ForEach(MBTIData.groups[selectedCategory] ?? [], id: \.self) { mbti in
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                            // MARK: Linear Gradient Color
                                .fill(LinearGradient(
                                    colors: [
                                        MBTIData.colors[mbti] ?? Color.purple,
                                        colorScheme == .dark
                                        ? (MBTIData.darkColors[mbti] ?? Color.purple.opacity(0.5))
                                        : (MBTIData.colors[mbti]?.opacity(0.2) ?? Color.purple.opacity(0.2))
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ))
                                .frame(width: 280, height: 280)
                            
                            Image(mbti)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 260, height: 260)
                        }
                        
                        Text(mbti)
                            .font(.largeTitle.bold())
                            .foregroundColor(.primary)
                        
                        Text(MBTIData.descriptions[mbti] ?? "")
                            .font(.body)
                            .foregroundColor(.primary.opacity(0.85))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 20)
                    .tag(mbti)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 530)
            
            Spacer()
            
            if let editmbtiBinding = editmbtiBinding {
                Button(action: {
                    editmbtiBinding.wrappedValue = selectedMBTI
                    dismiss()
                }) {
                    Text("Change")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 1.0, green: 0.87, blue: 0.7))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
            } else {
                // MARK: Props Drilling
                NavigationLink(destination: UserDescriptionView(
                    firstName: firstName,
                    lastName: lastName,
                    phoneNumber: phoneNumber,
                    mbti: selectedMBTI
                )) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 1.0, green: 0.87, blue: 0.7))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Choose Your MBTI")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("AppBackground")
                .ignoresSafeArea()
        )
        // MARK: Code Block run the first time View loaded and a page is closed and went back to this page
        .onAppear {
            // MARK: Unwrap Optional Var and set fill the Selected MBTI & Category to that value
            if let currentMBTI = editmbtiBinding?.wrappedValue {
                selectedMBTI = currentMBTI
            }
            selectedCategory = MBTIData.mbtiToGroup[selectedMBTI] ?? "Analyst"
        }
    }
}

// MARK: 2 Preview in 1 View
#Preview("Registration Mode") {
    NavigationStack {
        ChooseMBTIView(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6285959808110")
    }
}

#Preview("Edit Mode") {
    NavigationStack {
        ChooseMBTIView(editmbtiBinding: .constant("ENFP"))
    }
}
