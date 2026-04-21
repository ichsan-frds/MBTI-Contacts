import SwiftUI

struct UserDescriptionView: View {
    let selectedMBTI: String
    @Environment(\.dismiss) private var dismiss
    @State private var textInput: String = ""
    
    let maxTextLength: Int = 100
    
    var body: some View {
            VStack(spacing: 0) {
                Spacer()
                
                Text("Describe Yourself in One Sentence")
                    .font(.title.bold())
                    .foregroundColor(.white)
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
                    .bold()
                    .foregroundColor(.white)
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
        .navigationBarBackButtonHidden(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.16, green: 0.16, blue: 0.18)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    UserDescriptionView(selectedMBTI: "INTJ")
}
