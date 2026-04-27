//
//  ComparisonRow.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 24/04/26.
//

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
                    .foregroundStyle(.primary)
                
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.primary)
            }
            .frame(width: 60)
            
            ScrollView(showsIndicators: true) {
                // MARK: Use the relationship value to get the description of each category
                Text(ComparisonEngine.getDescription(for: archetype, in: category))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: .infinity)
        }
    }
}
