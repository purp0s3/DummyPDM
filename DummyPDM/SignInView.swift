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
    @State private var isPasswordVisible = false //a senha é oculta

    var body: some View {
        VStack {
                        
            Text("DummyPDM") //título
                .font(.largeTitle)
                .foregroundColor(Color.blue)
                .shadow(radius: 3)
                .multilineTextAlignment(.center)
                .padding()
                        
            Text("Programação para Dispositivos Móveis") //subtítulo
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                       
            ZStack {
                Image("logo") //logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .shadow(radius: 25)
                    .frame(width: 200, height: 200)
                            
                RoundedRectangle(cornerRadius: 15) //bordas arredondadas
                    .stroke(Color.black, lineWidth: 5)
                    .frame(width: 205, height: 205)
                }
            
        Spacer()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(radius: 3)
                .padding()
            
            ZStack(alignment: .trailing) {
                if isPasswordVisible {
                    TextField("Senha", text: $senha)
                    .shadow(radius: 3)
                } else {
                    SecureField("Senha", text: $senha)
                        .shadow(radius: 3)
                }
                Button(action: {
                    isPasswordVisible.toggle() //senha com botão mostrar/ocultar
                }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
                        .padding(.trailing, 8)
            }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
            
        Spacer()
            
            NavigationLink(
                destination: Text("Página de Perfil"), // profile
                label: {
                    Text("Entrar")
                        .font(Font.system(size: 22, weight: .bold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            
        Spacer()
            
            NavigationLink(
                destination: Text("Página de Cadastro"), // criar
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
