//
//  ChooseMBTIView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 17/04/26.
//

import SwiftUI

struct ChooseMBTIView: View {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    
    @State private var selectedCategory: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    
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
                                        MBTIData.darkColors[mbti] ?? Color.purple.opacity(0.5)
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
                            .foregroundColor(.white)
                        
                        Text(MBTIData.descriptions[mbti] ?? "")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.85))
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
            
            NavigationLink(destination: UserDescriptionView(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, mbti: selectedMBTI)) {
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
        .navigationTitle("Choose Your MBTI")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    NavigationStack {
        ChooseMBTIView(firstName: "Ichsan", lastName: "Firdaus", phoneNumber: "+6285959808110")
    }
}
