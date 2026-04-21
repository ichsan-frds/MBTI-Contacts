import SwiftUI

struct UserDescriptionView: View {
    let selectedMBTI: String
    @Environment(\.dismiss) private var dismiss
    @State private var textInput: String = ""
    @State private var navigateToMain: Bool = false
    
    let maxTextLength: Int = 100
    
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
    
    var titleColor: Color {
        mbtiColors[selectedMBTI] ?? Color.purple
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.15)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                Text("Describe Yourself in One Sentence")
                    .font(.title.bold())
                    .foregroundColor(titleColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                TextEditor(text: $textInput)
                    .onChange(of: textInput) { oldValue, newValue in
                        if newValue.count > maxTextLength {
                            textInput = String(newValue.prefix(maxTextLength))
                        }
                    }
                    .frame(height: 170)
                    .scrollContentBackground(.hidden)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.15))
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    )
                    .padding(.horizontal, 30)
                
                Text("\(textInput.count)/\(maxTextLength)")
                    .foregroundColor(.white.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 30)
                    .padding(.top, 6)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Image(selectedMBTI)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text(selectedMBTI)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                NavigationLink(destination: GroupedMBTIView(
                    initialMBTI: selectedMBTI,
                    userName: "Ichsan Firdaus",
                    userMBTI: selectedMBTI,
                    userDescription: textInput
                )) {
                    Text("Save")
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
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    UserDescriptionView(selectedMBTI: "INTJ")
}
