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
    case communication = "Communication"
    case workStyle = "Work Style"
    case social = "Social Energy"
    case conflict = "Conflict Resolution"
}

struct ComparisonEngine {
    
    // This is where you define the descriptions for the 4 archetypes across 4 categories.
    // Total: 16 descriptions instead of 1024!
    static func getDescription(for archetype: RelationshipArchetype, in category: ComparisonCategory) -> String {
        switch (archetype, category) {
        case (.soulmates, .communication):
            return "They finish each other's sentences. Ideas flow without judgment."
        case (.soulmates, .workStyle):
            return "Incredible synergy; one dreams big while the other builds the foundation."
        case (.clashing, .communication):
            return "Frequent misunderstandings. One speaks in logic, the other in emotions."
        case (.clashing, .conflict):
            return "A battle of wills. Both need to practice active listening to survive."
        // Add the other 12 cases here...
        default:
            return "A unique balance of traits that requires mutual understanding."
        }
    }
    
    // The "Matrix": Maps specific pairs to an Archetype
    static func getArchetype(user1: String, user2: String) -> RelationshipArchetype {
        let pair = Set([user1, user2])
        
        // Define specific logic or hardcode only the unique 'High' or 'Low' pairs
        if pair == Set(["INTJ", "ENFP"]) || pair == Set(["INFJ", "ENTP"]) {
            return .soulmates
        }
        
        if user1 == user2 {
            return .mirrors
        }
        
        // Default fallback for everything else
        return .growth
    }
}
