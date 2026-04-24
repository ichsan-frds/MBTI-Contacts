//
//  ComparisonRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 24/04/26.
//

import SwiftUI

import SwiftUI

struct ComparisonRow: View {
    let icon: String
    let title: String
    let category: ComparisonCategory
    let archetype: RelationshipArchetype
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack {
                Image(systemName: icon)
                    .font(.largeTitle.bold())
                
                Text(title)
                    .font(.caption)
            }
            .frame(width: 60)
            
            ScrollView(showsIndicators: true) {
                Text(ComparisonEngine.getDescription(for: archetype, in: category))
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: .infinity)
        }
        .foregroundStyle(.white)
    }
}
