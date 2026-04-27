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
    
    var editmbtiBinding: Binding<String>? = nil
    
    @State private var selectedCategory: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    
    @Environment(\.dismiss) private var dismiss
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
        .onAppear {
            if let currentMBTI = editmbtiBinding?.wrappedValue {
                selectedMBTI = currentMBTI
            }
            selectedCategory = MBTIData.mbtiToGroup[selectedMBTI] ?? "Analyst"
        }
    }
}

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
