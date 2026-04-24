//
//  ComparisonEngine.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 20/04/26.
//

import Foundation

enum RelationshipArchetype: String {
    case soulmates = "The Power Duo"
    case mirrors = "The Reflection"
    case growth = "The Growth Challenge"
    case clashing = "The Constant Friction"
}

enum ComparisonCategory: String, CaseIterable {
    case cognitive = "Cognitive"
    case teamwork = "Teamwork"
    case social = "Social"
    case decision = "Decision"
}

struct ComparisonEngine {
    
    static func getDescription(for archetype: RelationshipArchetype, in category: ComparisonCategory) -> String {
        switch (archetype, category) {
        
        case (.soulmates, .cognitive):
            return "Natural understanding. You skip the awkward small talk and jump straight into meaningful, deep exchanges."
        case (.soulmates, .teamwork):
            return "A powerful synergy. One’s strengths cover the other’s weaknesses, making you an unstoppable team."
        case (.soulmates, .social):
            return "You share a similar rhythm. You both know exactly when to push for adventure and when to recharge."
        case (.soulmates, .decision):
            return "Decisions are made with mutual respect. You naturally align on big choices and prioritize the relationship."

        case (.mirrors, .cognitive):
            return "You speak the same 'language.' Misunderstandings are rare because you process information identically."
        case (.mirrors, .teamwork):
            return "Shared pace and priorities. While efficient, you might share the same blind spots, so stay alert."
        case (.mirrors, .social):
            return "Your batteries drain and recharge at the same rate. Planning outings is easy with similar social needs."
        case (.mirrors, .decision):
            return "Like arguing with a mirror. You know exactly what the other is thinking, which leads to quick consensus or a stalemate."

        case (.clashing, .cognitive):
            return "Different wavelengths. One focuses on concrete facts while the other looks for hidden meanings."
        case (.clashing, .teamwork):
            return "Conflicting methods. One values strict structure while the other prefers spontaneous flexibility."
        case (.clashing, .social):
            return "A push-and-pull dynamic. You often have completely different ideas of what a perfect weekend looks like."
        case (.clashing, .decision):
            return "High friction potential. You must learn to value the other’s perspective to avoid repetitive arguments when making choices."

        case (.growth, .cognitive):
            return "You process information differently. Bridging your different mental models takes effort but helps you both grow."
        case (.growth, .teamwork):
            return "A learning curve. You work at different tempos, but once synced, you offer a highly balanced approach."
        case (.growth, .social):
            return "One is likely more active than the other. This creates a healthy balance of comfort and boundary-pushing."
        case (.growth, .decision):
            return "A chance to broaden your view. Reaching a consensus requires stepping out of your comfort zone."
        }
    }
    
    static func getArchetype(user1: String, user2: String) -> RelationshipArchetype {
        if user1 == user2 { return .mirrors }
        
        let pair = Set([user1, user2])
        
        let soulmatePairs: [Set<String>] = [
            ["INTJ", "ENFP"], ["INFJ", "ENTP"], ["INFP", "ENFJ"], ["INTP", "ENTJ"],
            ["ISTJ", "ESFP"], ["ISFJ", "ESTP"], ["ISFP", "ESTJ"], ["ISTP", "ESFJ"]
        ]
        
        if soulmatePairs.contains(pair) { return .soulmates }
        
        let clashingPairs: [Set<String>] = [
            ["INTJ", "ESFJ"], ["INFJ", "ESTP"], ["INFP", "ESTJ"], ["INTP", "ESFP"],
            ["ISTJ", "ENFJ"], ["ISFJ", "ENTP"], ["ISFP", "ENTJ"], ["ISTP", "ENFP"]
        ]
        
        if clashingPairs.contains(pair) { return .clashing }
        
        return .growth
    }
}
