//
//  AddContact.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 20/04/26.
//

import SwiftUI
import SwiftData

struct AddContact: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    
    private var isFormValid: Bool {
        !firstName.isEmpty && !phoneNumber.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    TextField("", text: $firstName, prompt: Text("First Name").foregroundColor(.white.opacity(0.5)))
                        .foregroundColor(.white)
                        .tint(.white)
                    Divider().background(Color.white.opacity(0.3))
                    
                    TextField("", text: $lastName, prompt: Text("Last Name").foregroundColor(.white.opacity(0.5)))
                        .foregroundColor(.white)
                        .tint(.white)
                    Divider().background(Color.white.opacity(0.3))
                    
                    TextField("", text: $phoneNumber, prompt: Text("Phone Number").foregroundColor(.white.opacity(0.5)))
                        .foregroundColor(.white)
                        .tint(.white)
                        .keyboardType(.phonePad)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 25).foregroundStyle(Color.white.opacity(0.1)))
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.16, green: 0.16, blue: 0.18)
                    .ignoresSafeArea()
            )
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let newContact = Contact(
                            firstName: firstName,
                            lastName: lastName,
                            phoneNumber: phoneNumber,
                            mbti: MBTIData.randomMBTI,
                            desc: MBTIData.randomDesc
                        )
                        
                        modelContext.insert(newContact)
                        try? modelContext.save()
                        
                        dismiss()
                    }) {
                        Image(systemName: "checkmark")
                            .font(.body.bold())
                            .foregroundColor(isFormValid ? .black : .white.opacity(0.5))
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(isFormValid ? Color(red: 1.0, green: 0.87, blue: 0.7) : Color.white.opacity(0.15))
                    .disabled(!isFormValid)
                }
            }
        }
    }
}

#Preview {
    Text("Background View")
        .sheet(isPresented: .constant(true)) {
            AddContact()
                .presentationDetents([.fraction(0.3)])
        }
}
