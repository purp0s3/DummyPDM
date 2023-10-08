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
                        
            
            Text("Programação para Dispositivos Móveis") //subtítulo
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 99)
                      
            
            ZStack {
                Image("logo") //logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .shadow(radius: 25)
                    .frame(width: 200, height: 200)
                    .padding(.top, -35)
                            
                RoundedRectangle(cornerRadius: 15) //bordas arredondadas
                    .stroke(Color.black, lineWidth: 5)
                    .frame(width: 205, height: 205)
                    .padding(.top, -35)
                }
            
            
            Text("Quem é você?")
                .font(.title)
                .multilineTextAlignment(.center)
                .shadow(radius:3)
                .padding(.top, 40)

            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 27))
                .shadow(radius: 3)
            
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
                    isPasswordVisible.toggle() //senha com botão mostrar/ocultar
                }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
                        .padding(.trailing, 8)
            }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
            
            
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
            
            .padding()
            
            NavigationLink(
                destination: Text("Página de Cadastro"), // criar
                label: {
                    Text("Criar conta")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.bottom, 85)
                }
            )
            
            .padding()
            
            Text("Unicid, São Paulo.\n2023.")
                .font(Font.system(size: 12))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.top, -100)
            
        }
        .padding()
    }
}
