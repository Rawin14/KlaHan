//
//  RegisterView.swift
//  KlaHan
//
//  Created by Jeerapan Chirachanchai on 27/4/2568 BE.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var dateOfBirth = Date()
    @State private var phoneNumber = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 0/255, green: 105/255, blue: 92/255))
            
            TextField("Full Name", text: $name)
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(8)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                           .datePickerStyle(CompactDatePickerStyle())
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(8)
                       
                       // Phone Number Field
                       TextField("Phone Number", text: $phoneNumber)
                           .keyboardType(.phonePad)
                           .padding()
                           .background(Color.gray.opacity(0.2))
                           .cornerRadius(8)
            
            Button(action: {
                // สมมติว่าสมัครสำเร็จ
                dismiss()
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0/255, green: 105/255, blue: 92/255))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
}
