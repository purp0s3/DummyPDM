//
//  SignUpView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 08/10/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @Binding var isSignInActive: Bool

    var body: some View {
        VStack {
            Text("Cadastro")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(radius: 3)
                .padding()

            TextField("Nome Completo", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
                .textInputAutocapitalization(.words)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding()

            ZStack(alignment: .trailing) {
                if isPasswordVisible {
                    TextField("Senha", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.system(size: 27))
                        .shadow(radius: 3)
                        .textInputAutocapitalization(.never)
                } else {
                    SecureField("Senha", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.system(size: 27))
                        .shadow(radius: 3)
                        .textInputAutocapitalization(.never)
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .frame(width: 40 , height: 40)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
            .padding()

            Button(action: {
                // Save user data to UserDefaults
                UserDefaults.standard.set(name, forKey: "name")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(password, forKey: "password")
                UserDefaults.standard.synchronize()

                isSignInActive = true
            }) {
                Text("Criar")
                    .font(Font.system(size: 22, weight: .bold))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

