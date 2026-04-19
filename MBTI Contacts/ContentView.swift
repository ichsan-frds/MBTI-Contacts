//
//  ContentView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 16/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Item]
    
    @State private var selectedCategory: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    
    let mbtiGroups: [String: [String]] = [
        "Analyst": ["INTJ", "INTP", "ENTJ", "ENTP"],
        "Diplomats": ["INFJ", "INFP", "ENFJ", "ENFP"],
        "Sentinels": ["ISTJ", "ISFJ", "ESTJ", "ESFJ"],
        "Explorers": ["ISTP", "ISFP", "ESTP", "ESFP"]
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Choose Your MBTI")
                    .font(.title3.bold())
                    .padding(.top, 20)
                Dropdown(selection: $selectedCategory)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                TabView(selection: $selectedMBTI) {
                    ForEach(mbtiGroups[selectedCategory] ?? [], id: \.self) { mbti in
                        VStack(spacing: 20) {
                            Image(mbti)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                            
                            Text(mbti)
                                .font(Font.largeTitle.bold())
                        }
                        .padding(.bottom, 50)
                        .tag(mbti)
                    }
                }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .frame(height: 450)
                Text("Swipe left or right")
                    .foregroundStyle(.gray)
                Spacer()
                NavigationLink(destination: UserDescriptionView(selectedMBTI: selectedMBTI)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)
//                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
