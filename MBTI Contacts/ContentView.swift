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
    
    @State private var selectedCategory: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    
    let mbtiGroupOrder: [String] = ["Analyst", "Diplomats", "Sentinels", "Explorers"]
    
    let mbtiGroups: [String: [String]] = [
        "Analyst":   ["INTJ", "INTP", "ENTJ", "ENTP"],
        "Diplomats": ["INFJ", "INFP", "ENFJ", "ENFP"],
        "Sentinels": ["ISTJ", "ISFJ", "ESTJ", "ESFJ"],
        "Explorers": ["ISTP", "ISFP", "ESTP", "ESFP"]
    ]
    
    let mbtiColors: [String: Color] = [
        "INTJ": Color(red: 0.75, green: 0.4, blue: 0.95),
        "INTP": Color(red: 0.75, green: 0.4, blue: 0.95),
        "ENTJ": Color(red: 0.75, green: 0.4, blue: 0.95),
        "ENTP": Color(red: 0.75, green: 0.4, blue: 0.95),
        
        "ISTJ": Color(red: 0.3, green: 0.6, blue: 1.0),
        "ISFJ": Color(red: 0.3, green: 0.6, blue: 1.0),
        "ESTJ": Color(red: 0.3, green: 0.6, blue: 1.0),
        "ESFJ": Color(red: 0.3, green: 0.6, blue: 1.0),
        
        "INFJ": Color(red: 0.2, green: 0.85, blue: 0.55),
        "INFP": Color(red: 0.2, green: 0.85, blue: 0.55),
        "ENFJ": Color(red: 0.2, green: 0.85, blue: 0.55),
        "ENFP": Color(red: 0.2, green: 0.85, blue: 0.55),
        
        "ISTP": Color(red: 1.0, green: 0.7, blue: 0.2),
        "ISFP": Color(red: 1.0, green: 0.7, blue: 0.2),
        "ESTP": Color(red: 1.0, green: 0.7, blue: 0.2),
        "ESFP": Color(red: 1.0, green: 0.7, blue: 0.2)
    ]
    
    let mbtiDescriptions: [String: String] = [
        "INTJ": "The INTJ is a dreamer who remains grounded in reality. They believe that with enough logic and effort, any goal is achievable.",
        "INTP": "The INTP is a creative thinker who loves exploring ideas and theories. They seek truth and logical consistency above all.",
        "ENTJ": "The ENTJ is a natural leader who thrives on challenge and strategy. They are decisive and always push toward success.",
        "ENTP": "The ENTP is an innovative debater who loves intellectual challenges. They constantly explore new possibilities.",
        
        "INFJ": "The INFJ is a rare idealist with deep insight into people. They are driven by a strong sense of purpose and vision.",
        "INFP": "The INFP is a thoughtful and caring soul who lives by their values. They seek meaning in everything they do.",
        "ENFJ": "The ENFJ is a warm and inspiring leader who genuinely cares for others. They bring out the best in people around them.",
        "ENFP": "The ENFP is an enthusiastic free spirit who sees life full of possibilities. They love connecting with people.",
        
        "ISTJ": "The ISTJ is a responsible and dependable person. They value tradition, loyalty, and getting things done right.",
        "ISFJ": "The ISFJ is a dedicated protector who is always ready to help. They remember every detail about the people they care about.",
        "ESTJ": "The ESTJ is an organized and strong-willed leader. They value order, honesty, and dedication in everything.",
        "ESFJ": "The ESFJ is a warm and caring person who loves bringing people together. They thrive when helping others.",
        
        "ISTP": "The ISTP is a bold and practical experimenter. They love diving into projects and figuring out how things work.",
        "ISFP": "The ISFP is a gentle and artistic soul who lives in the present. They express themselves through creativity and kindness.",
        "ESTP": "The ESTP is an energetic and perceptive doer. They love taking action and thrive in fast-paced environments.",
        "ESFP": "The ESFP is a spontaneous and fun-loving entertainer. They bring joy and energy wherever they go."
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.13, green: 0.13, blue: 0.15)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Choose Your MBTI")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    DarkDropdown(selection: $selectedCategory)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        // Saat category berubah, reset selectedMBTI ke item pertama
                        .onChange(of: selectedCategory) { oldValue, newValue in
                            if let firstMBTI = mbtiGroups[newValue]?.first {
                                selectedMBTI = firstMBTI
                            }
                        }
                    
                    TabView(selection: $selectedMBTI) {
                        ForEach(mbtiGroups[selectedCategory] ?? [], id: \.self) { mbti in
                            VStack(spacing: 16) {
                                ZStack {
                                    Circle()
                                        .fill(mbtiColors[mbti] ?? Color.gray)
                                        .frame(width: 280, height: 280)
                                    
                                    Image(mbti)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 260, height: 260)
                                }
                                
                                Text(mbti)
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.white)
                                
                                Text(mbtiDescriptions[mbti] ?? "")
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
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Contact.self, inMemory: true)
}
