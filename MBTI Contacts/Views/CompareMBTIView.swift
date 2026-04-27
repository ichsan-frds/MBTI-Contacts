//
//  CompareMBTIView.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 23/04/26.
//

import SwiftUI
import SwiftData

struct CompareMBTIView : View {
    let contact: Contact
    
    @Query private var users: [User]
    private var currentUser: User {
        users.first ?? User(firstName: "User", lastName: "", phoneNumber: "", mbti: "INTJ", desc: "")
    }
    
    // MARK: Get the relationship between 2 mbti
    private var archetype: RelationshipArchetype {
        ComparisonEngine.getArchetype(user1: currentUser.mbti, user2: contact.mbti)
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body : some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: -40) {
                    Image(currentUser.mbti)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .zIndex(1)
                    
                    Image(contact.mbti)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .scaleEffect(x: -1, y: 1)
                        .zIndex(0)
                }
                
                if currentUser.mbti == contact.mbti {
                    HStack(spacing: -30) {
                        Text(contact.mbti)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(
                                MBTIData.groupColors[MBTIData.mbtiToGroup[contact.mbti] ?? "Analyst"] ?? .primary
                            )
                            .cornerRadius(999)
                    }
                    .padding(.horizontal)
                } else {
                    HStack(spacing: -30) {
                        Text(currentUser.mbti)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(
                                MBTIData.groupColors[MBTIData.mbtiToGroup[currentUser.mbti] ?? "Analyst"] ?? .primary
                            )
                            .clipShape(UnevenRoundedRectangle(
                                topLeadingRadius: 20,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 0
                            ))
                            .zIndex(0)
                        
                        Text(contact.mbti)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(
                                MBTIData.groupColors[MBTIData.mbtiToGroup[contact.mbti] ?? "Analyst"] ?? .primary
                            )
                            .cornerRadius(999)
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Comparison Insight")
                        .bold()
                        .foregroundColor(.primary)
                    
                    ComparisonRow(icon: "brain.filled.head.profile", title: "Cognitive", category: .cognitive, archetype: archetype)
                    
                    Divider().background(Color.primary.opacity(0.15))
                    
                    ComparisonRow(icon: "person.2.badge.gearshape", title: "Teamwork", category: .teamwork, archetype: archetype)
                    
                    Divider().background(Color.primary.opacity(0.15))
                    
                    ComparisonRow(icon: "bubble.left.and.text.bubble.right", title: "Social", category: .social, archetype: archetype)
                    
                    Divider().background(Color.primary.opacity(0.15))
                    
                    ComparisonRow(icon: "scalemass", title: "Decision", category: .decision, archetype: archetype)
                    
                }
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.primary.opacity(0.05))
                )
                .padding(.horizontal)
            }
            .padding(.top, 10)
        }
        .navigationTitle("Compare MBTI")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("AppBackground")
                .ignoresSafeArea()
        )
    }
}

#Preview {
    NavigationStack {
        CompareMBTIView(contact: Contact(firstName: "Andres", lastName: "Iniesta", phoneNumber: "+6212345678990", mbti: "ENFJ", desc: "Calm and has a great vision in life"))
    }
}
