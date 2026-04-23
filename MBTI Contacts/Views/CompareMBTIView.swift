//
//  CompareMBTIView().swift
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
    
    var body : some View {
        VStack(spacing: 20) {
            HStack(spacing: -40) {
                Image(currentUser.mbti)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 275, height: 275)
                    .zIndex(1)
                
                Image(contact.mbti)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 275, height: 275)
                    .scaleEffect(x: -1, y: 1)
                    .zIndex(0)
            }
            
            HStack(spacing: -30) {
                Text(currentUser.mbti)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(LinearGradient(
                        colors: [
                            MBTIData.colors[currentUser.mbti] ?? Color.purple,
                            MBTIData.darkColors[currentUser.mbti] ?? Color.purple.opacity(0.5)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
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
                    .background(LinearGradient(
                        colors: [
                            MBTIData.colors[contact.mbti] ?? Color.purple,
                            MBTIData.darkColors[contact.mbti] ?? Color.purple.opacity(0.5)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .cornerRadius(999)
            }
            .padding(.horizontal, 70)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Comparison Insight").bold().foregroundColor(.white)
                HStack(alignment: .top, spacing: 12) {
                    VStack {
                        Image(systemName: "brain.filled.head.profile")
                            .font(.largeTitle.bold())
                        
                        Text("Cognitive")
                            .font(.caption)
                    }
                    .frame(width: 60)
                    
                    ScrollView(showsIndicators: true) {
                        Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxHeight: .infinity)
                }
                
                Divider().background(Color.white.opacity(0.3))
                
                HStack(alignment: .top, spacing: 12) {
                    VStack {
                        Image(systemName: "person.2.badge.gearshape")
                            .font(.largeTitle.bold())
                        
                        Text("Intuition")
                            .font(.caption)
                    }
                    .frame(width: 60)
                    
                    ScrollView(showsIndicators: true) {
                        Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Sed ut perspiciatis unde")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxHeight: .infinity)
                }
                
                Divider().background(Color.white.opacity(0.3))
                
                HStack(alignment: .top, spacing: 12) {
                    VStack {
                        Image(systemName: "bubble.left.and.text.bubble.right")
                            .font(.largeTitle.bold())
                        
                        Text("Social")
                            .font(.caption)
                    }
                    .frame(width: 60)
                    
                    ScrollView(showsIndicators: true) {
                        Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxHeight: .infinity)
                }
                
                Divider().background(Color.white.opacity(0.3))
                
                HStack(alignment: .top, spacing: 12) {
                    VStack {
                        Image(systemName: "scalemass.fill")
                            .font(.largeTitle.bold())
                        
                        Text("Decision")
                            .font(.caption)
                    }
                    .frame(width: 60)
                    
                    ScrollView(showsIndicators: true) {
                        Text("Sed ut")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxHeight: .infinity)
                }
                
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .frame(minHeight: 65)
            .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))
            .padding(.horizontal, 70)
        }
        .navigationTitle("Compare MBTI")
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
        CompareMBTIView(contact: Contact(firstName: "Andres", lastName: "Iniesta", phoneNumber: "+6212345678990", mbti: "ENFJ", desc: "Calm and has a great vision in life Calm and has a great vision in life Calm and has a great vision"))
    }
}
