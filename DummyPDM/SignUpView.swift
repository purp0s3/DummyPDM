//
//  SignUpView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 08/10/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var nome = ""
    @State private var telefone = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var isPasswordVisible = false // a senha é oculta

    var body: some View {
        VStack {
            Text("Cadastro") // título
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

            
            TextField("Nome Completo", text: $nome)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
                .textInputAutocapitalization(.words)
                .padding()
            
            
            TextField("Telefone", text: $telefone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
                .textInputAutocapitalization(.never)
                .padding()
            
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
                .textInputAutocapitalization(.never)
                .padding()

            ZStack(alignment: .trailing) {
                if isPasswordVisible {
                    TextField("Senha", text: $senha)
                        .font(Font.system(size: 27))
                        .shadow(radius: 3)
                } else {
                    SecureField("Senha", text: $senha)
                        .font(Font.system(size: 27))
                        .shadow(radius: 3)
                }
                Button(action: {
                    isPasswordVisible.toggle() // senha com botão mostrar/ocultar
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .frame(width: 40 , height: 40)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textInputAutocapitalization(.never)
            .padding()

            NavigationLink(
                destination: SignInView().navigationBarBackButtonHidden(true), // profile
                label: {
                    Text("Criar")
                        .font(Font.system(size: 22, weight: .bold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            .navigationViewStyle(.stack)

            .padding()
        }
        .padding()
    }
}
