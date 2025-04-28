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
    @State private var showingResetAlert = false
    @State private var resetMessage = ""
    
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
            
            // ปุ่ม Forgot Password
            Button(action: {
                sendPasswordReset()
            }) {
                Text("Forgot Password?")
                    .font(.footnote)
                    .foregroundColor(Color.blue)
            }
            .padding(.top, -30)
            
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
        .alert(isPresented: $showingResetAlert) {
            Alert(title: Text("Password Reset"), message: Text(resetMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func sendPasswordReset() {
        guard !email.isEmpty else {
            resetMessage = "Please enter your email address first."
            showingResetAlert = true
            return
        }
        
        guard let url = URL(string: "https://your-backend.com/api/forgot-password") else {
            resetMessage = "Invalid server URL."
            showingResetAlert = true
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["email": email]
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    resetMessage = "Error: \(error.localizedDescription)"
                    showingResetAlert = true
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    resetMessage = "No response from server."
                    showingResetAlert = true
                }
                return
            }
            
            if let serverResponse = try? JSONDecoder().decode(ServerResponse.self, from: data) {
                DispatchQueue.main.async {
                    resetMessage = serverResponse.message
                    showingResetAlert = true
                }
            } else {
                DispatchQueue.main.async {
                    resetMessage = "Invalid response from server."
                    showingResetAlert = true
                }
            }
        }.resume()
    }
    
    struct ServerResponse: Decodable {
        let message: String
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
