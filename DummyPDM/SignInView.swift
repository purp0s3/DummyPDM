//
//  SignInView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 07/10/23.
//


import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var senha = ""

    var body: some View {
        VStack {
                        
            Text("DummyPDM")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                        
            Text("Programação para Dispositivos Móveis")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                       
            ZStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                            
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 5)
                    .frame(width: 205, height: 205)
                        }
            
            Spacer()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Senha", text: $senha)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(
                destination: Text("Página de Perfil"), // Replace with the user profile page
                label: {
                    Text("Entrar")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            
            Spacer()
            
            NavigationLink(
                destination: Text("Página de Cadastro"), // Replace with the sign-up page
                label: {
                    Text("Criar conta")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.blue)
                }
            )
            
            Spacer()
        }
        .padding()
    }
}
