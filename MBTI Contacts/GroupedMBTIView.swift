import SwiftUI

struct GroupedMBTIView: View {
    var initialMBTI: String = "INTJ"
    var userName: String = "Ichsan Firdaus"
    var userMBTI: String = "INTJ"
    var userDescription: String = ""

    @State private var selectedGroup: String = "Analyst"
    @State private var selectedMBTI: String = "INTJ"
    @State private var contacts: [Contact] = ContactSeeder.defaultContacts

    let mbtiGroups: [String] = ["Analyst", "Diplomats", "Sentinels", "Explorers"]
    let mbtiGroupsMap: [String: [String]] = [
        "Analyst":   ["INTJ", "INTP", "ENTJ", "ENTP"],
        "Diplomats": ["INFJ", "INFP", "ENFJ", "ENFP"],
        "Sentinels": ["ISTJ", "ISFJ", "ESTJ", "ESFJ"],
        "Explorers": ["ISTP", "ISFP", "ESTP", "ESFP"]
    ]

    let mbtiToGroup: [String: String] = [
        "INTJ": "Analyst", "INTP": "Analyst", "ENTJ": "Analyst", "ENTP": "Analyst",
        "INFJ": "Diplomats", "INFP": "Diplomats", "ENFJ": "Diplomats", "ENFP": "Diplomats",
        "ISTJ": "Sentinels", "ISFJ": "Sentinels", "ESTJ": "Sentinels", "ESFJ": "Sentinels",
        "ISTP": "Explorers", "ISFP": "Explorers", "ESTP": "Explorers", "ESFP": "Explorers"
    ]

    let mbtiColors: [String: Color] = [
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

    let mbtiDarkColors: [String: Color] = [
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

    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.15)
                .ignoresSafeArea()

            VStack(spacing: 16) {

                Text("MBTI Contacts")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .padding(.top, 20)

                HStack(spacing: 8) {
                    ForEach(mbtiGroups, id: \.self) { group in
                        Button(action: {
                            selectedGroup = group
                            if let firstMBTI = mbtiGroupsMap[group]?.first {
                                selectedMBTI = firstMBTI
                            }
                        }) {
                            Text(group)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .background(
                                    selectedGroup == group
                                    ? Color.white.opacity(0.25)
                                    : Color.white.opacity(0.08)
                                )
                                .cornerRadius(50)
                        }
                    }
                }
                .padding(.horizontal, 16)

                TabView(selection: $selectedMBTI) {
                    ForEach(mbtiGroupsMap[selectedGroup] ?? [], id: \.self) { mbti in

                        VStack(alignment: .leading, spacing: 0) {

                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                mbtiColors[mbti] ?? Color.purple,
                                                mbtiDarkColors[mbti] ?? Color.purple.opacity(0.5)
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 500)

                                let filteredContacts = contacts.filter { $0.mbti == mbti }
                                let groupedContacts = Dictionary(grouping: filteredContacts) {
                                    String($0.firstName.prefix(1)).uppercased()
                                }

                                if mbti == userMBTI && filteredContacts.isEmpty {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(mbti)
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .padding(.top, 20)
                                            .padding(.bottom, 8)

                                        UserProfileRow(userName: userName)

                                        Spacer()
                                    }
                                    .frame(height: 500)

                                } else if mbti == userMBTI {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(mbti)
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .padding(.top, 20)
                                            .padding(.bottom, 8)

                                        UserProfileRow(userName: userName)

                                        Divider()
                                            .background(Color.white.opacity(0.15))
                                            .padding(.leading, 76)

                                        ScrollView {
                                            VStack(alignment: .leading, spacing: 0) {
                                                ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                                                    HStack {
                                                        Text(letter)
                                                            .font(.footnote.bold())
                                                            .foregroundColor(.white.opacity(0.5))
                                                            .padding(.leading, 16)
                                                        Spacer()
                                                    }
                                                    .padding(.top, 12)
                                                    .padding(.bottom, 4)

                                                    Divider()
                                                        .background(Color.white.opacity(0.2))

                                                    ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                                        ContactRowDark(contact: contact)
                                                    }
                                                }
                                            }
                                            .padding(.top, 4)
                                        }
                                        .frame(maxHeight: .infinity)
                                    }
                                    .frame(height: 500)

                                } else if filteredContacts.isEmpty {
                                    VStack {
                                        Text(mbti)
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                            .padding(.top, 20)
                                        Spacer()
                                        Text("No \(mbti) contacts yet")
                                            .foregroundColor(.white.opacity(0.5))
                                        Spacer()
                                    }
                                    .frame(height: 500)

                                } else {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(mbti)
                                            .font(.title2.bold())
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .padding(.top, 20)
                                            .padding(.bottom, 8)

                                        ScrollView {
                                            VStack(alignment: .leading, spacing: 0) {
                                                ForEach(groupedContacts.keys.sorted(), id: \.self) { letter in
                                                    HStack {
                                                        Text(letter)
                                                            .font(.footnote.bold())
                                                            .foregroundColor(.white.opacity(0.5))
                                                            .padding(.leading, 16)
                                                        Spacer()
                                                    }
                                                    .padding(.top, 12)
                                                    .padding(.bottom, 4)

                                                    Divider()
                                                        .background(Color.white.opacity(0.2))

                                                    ForEach(groupedContacts[letter] ?? [], id: \.phoneNumber) { contact in
                                                        ContactRowDark(contact: contact)
                                                    }
                                                }
                                            }
                                            .padding(.top, 4)
                                        }
                                        .frame(maxHeight: .infinity)
                                    }
                                    .frame(height: 500)
                                }
                            }

                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .tag(mbti)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(maxHeight: .infinity)

                HStack(spacing: 10) {
                    NavigationLink(destination: SearchContactsView()) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white.opacity(0.6))
                            Text("Search")
                                .foregroundColor(.white.opacity(0.6))
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(30)
                    }

                    Button(action: {
                        print("Add Contact Sheet")
                    }) {
                        Image(systemName: "plus")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(14)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(999)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            selectedMBTI = initialMBTI
            selectedGroup = mbtiToGroup[initialMBTI] ?? "Analyst"
        }
    }
}

struct UserProfileRow: View {
    let userName: String

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.black.opacity(0.25))
                    .frame(width: 46, height: 46)
                let parts = userName.split(separator: " ")
                let initials = parts.prefix(2).compactMap { $0.first }.map { String($0) }.joined()
                Text(initials.uppercased())
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(userName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("My Profile")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.55))
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }
}

struct ContactRowDark: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.black.opacity(0.25))
                    .frame(width: 46, height: 46)
                Text("\(contact.firstName.prefix(1).uppercased())\(contact.lastName.prefix(1).uppercased())")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }

            Text("\(contact.firstName) \(contact.lastName)")
                .font(.headline)
                .foregroundColor(.white)

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)

        Divider()
            .background(Color.white.opacity(0.15))
            .padding(.leading, 76)
    }
}

#Preview {
    GroupedMBTIView(
        initialMBTI: "INTJ",
        userName: "Ichsan Firdaus",
        userMBTI: "INTJ",
        userDescription: "Calm and has a great vision in life"
    )
}
