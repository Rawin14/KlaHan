//
//  LoginView.swift
//  KlaHan
//
//  Created by Jeerapan Chirachanchai on 27/4/2568 BE.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 0/255, green: 105/255, blue: 92/255))
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                // สมมติว่าล็อกอินสำเร็จ
                isLoggedIn = true
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0/255, green: 105/255, blue: 92/255))
                    .cornerRadius(8)
            }
            
            HStack {
                Text("Don't have an account?")
                NavigationLink("Register") {
                    RegisterView()
                }
            }
            .padding(.top, 10)
            
            Divider()
                .padding(.vertical, 20)
            
            Button(action: {
                // ตรงนี้สมมติว่า Login ด้วย Google
                isLoggedIn = true
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign in with Google")
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}


