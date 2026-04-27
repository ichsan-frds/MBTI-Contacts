//
//  MBTIData.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 21/04/26.
//

import SwiftUI
import SwiftData

struct MBTIData {
    // MARK: Array of MBTI and it's Groups
    static let mbtiGroups: [String] = ["Analyst", "Diplomats", "Sentinels", "Explorers"]
    static let possibleMBTIs: [String] = Array(descriptions.keys)
    
    // MARK: 2D Array, displays MBTI Groups and all of the MBTI inside the group
    static let groups: [String: [String]] = [
        "Analyst":   ["INTJ", "INTP", "ENTJ", "ENTP"],
        "Diplomats": ["INFJ", "INFP", "ENFJ", "ENFP"],
        "Sentinels": ["ISTJ", "ISFJ", "ESTJ", "ESFJ"],
        "Explorers": ["ISTP", "ISFP", "ESTP", "ESFP"]
    ]
    
    // MARK: Map every MBTI to it's group
    static let mbtiToGroup: [String: String] = [
        "INTJ": "Analyst", "INTP": "Analyst", "ENTJ": "Analyst", "ENTP": "Analyst",
        "INFJ": "Diplomats", "INFP": "Diplomats", "ENFJ": "Diplomats", "ENFP": "Diplomats",
        "ISTJ": "Sentinels", "ISFJ": "Sentinels", "ESTJ": "Sentinels", "ESFJ": "Sentinels",
        "ISTP": "Explorers", "ISFP": "Explorers", "ESTP": "Explorers", "ESFP": "Explorers"
    ]
    
    // MARK: Map every MBTI Groups individual color
    static let groupColors: [String: Color] = [
        "Analyst": Color(red: 0.75, green: 0.4,  blue: 0.95),
        "Diplomats": Color(red: 0.2,  green: 0.85, blue: 0.55),
        "Sentinels": Color(red: 0.3,  green: 0.6,  blue: 1.0),
        "Explorers": Color(red: 1.0,  green: 0.7,  blue: 0.2),
    ]
    
    // MARK: Map every MBTI individual light color (for LinearGradient)
    static let colors: [String: Color] = [
        "INTJ": Color(red: 0.75, green: 0.4,  blue: 0.95),
        "INTP": Color(red: 0.75, green: 0.4,  blue: 0.95),
        "ENTJ": Color(red: 0.75, green: 0.4,  blue: 0.95),
        "ENTP": Color(red: 0.75, green: 0.4,  blue: 0.95),
        "ISTJ": Color(red: 0.3,  green: 0.6,  blue: 1.0),
        "ISFJ": Color(red: 0.3,  green: 0.6,  blue: 1.0),
        "ESTJ": Color(red: 0.3,  green: 0.6,  blue: 1.0),
        "ESFJ": Color(red: 0.3,  green: 0.6,  blue: 1.0),
        "INFJ": Color(red: 0.2,  green: 0.85, blue: 0.55),
        "INFP": Color(red: 0.2,  green: 0.85, blue: 0.55),
        "ENFJ": Color(red: 0.2,  green: 0.85, blue: 0.55),
        "ENFP": Color(red: 0.2,  green: 0.85, blue: 0.55),
        "ISTP": Color(red: 1.0,  green: 0.7,  blue: 0.2),
        "ISFP": Color(red: 1.0,  green: 0.7,  blue: 0.2),
        "ESTP": Color(red: 1.0,  green: 0.7,  blue: 0.2),
        "ESFP": Color(red: 1.0,  green: 0.7,  blue: 0.2)
    ]
    
    // MARK: Map every MBTI individual dark color (for LinearGradient)
    static let darkColors: [String: Color] = [
        "INTJ": Color(red: 0.4,  green: 0.1,  blue: 0.6),
        "INTP": Color(red: 0.4,  green: 0.1,  blue: 0.6),
        "ENTJ": Color(red: 0.4,  green: 0.1,  blue: 0.6),
        "ENTP": Color(red: 0.4,  green: 0.1,  blue: 0.6),
        "ISTJ": Color(red: 0.1,  green: 0.3,  blue: 0.7),
        "ISFJ": Color(red: 0.1,  green: 0.3,  blue: 0.7),
        "ESTJ": Color(red: 0.1,  green: 0.3,  blue: 0.7),
        "ESFJ": Color(red: 0.1,  green: 0.3,  blue: 0.7),
        "INFJ": Color(red: 0.05, green: 0.45, blue: 0.25),
        "INFP": Color(red: 0.05, green: 0.45, blue: 0.25),
        "ENFJ": Color(red: 0.05, green: 0.45, blue: 0.25),
        "ENFP": Color(red: 0.05, green: 0.45, blue: 0.25),
        "ISTP": Color(red: 0.6,  green: 0.35, blue: 0.05),
        "ISFP": Color(red: 0.6,  green: 0.35, blue: 0.05),
        "ESTP": Color(red: 0.6,  green: 0.35, blue: 0.05),
        "ESFP": Color(red: 0.6,  green: 0.35, blue: 0.05)
    ]
    
    // MARK: Map every MBTI individual descriptions
    static let descriptions: [String: String] = [
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
    
    // MARK: Hardocode dummy desc
    static let possibleDescs: [String] = [
        "Calm and has a great vision in life.",
        "Strong and specialized in long range goals",
        "Quick reflexes and always ready to act",
        "Kind and always gives a helping hand to other people",
        "Likes to solve problems and always try to find a solution",
    ]
    
    // MARK: Pick random mbti and dummy desc
    static var randomMBTI: String {
        possibleMBTIs.randomElement() ?? "INTJ"
    }
    
    static var randomDesc: String {
        possibleDescs.randomElement() ?? "Mysterious Person."
    }
    
    // MARK: MainActor = Run Func in Main Thread
    @MainActor
    // MARK: For the first time the app is used, seed contacts data
    static func seedData(context: ModelContext) {
        // MARK: UserDefaults = Config for user preference
        let defaults = UserDefaults.standard
        let hasSeeded = defaults.bool(forKey: "hasSeededData")
        
        if hasSeeded {
            print("Data already seeded previously. Skipping.")
            return
        }
        
        do {
            for contact in ContactSeeder.defaultContacts {
                context.insert(contact)
            }
            
            try context.save()
            
            defaults.set(true, forKey: "hasSeededData")
            print("Successfully seeded initial contacts and set flag.")
            
        } catch {
            print("Failed to seed database: \(error)")
        }
    }
}
