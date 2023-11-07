//
//  SignInView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 07/10/23.
//


import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false // a senha é oculta
    @State private var isSignInSuccessful = false
    @Binding var isSignInActive: Bool
    
    var body: some View {
        NavigationView {
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
                    .padding(.bottom, 5)
                
                
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
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 15) //bordas arredondadas
                        .stroke(Color.black, lineWidth: 5)
                        .frame(width: 205, height: 205)
                        .padding()
                }
                
                
                Text("Quem é você?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .shadow(radius:3)
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
                        isPasswordVisible.toggle() // senha com botão mostrar/ocultar
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .frame(width: 40 , height: 40)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
                .padding()
                
                NavigationLink(
                    destination: UserProfileView(),
                    isActive: $isSignInSuccessful,
                    label: {
                        EmptyView()
                    }
                )
                .opacity(0)

                
                Button(action: {
                    // Check
                    if let savedEmail = UserDefaults.standard.string(forKey: "email"),
                       let savedPassword = UserDefaults.standard.string(forKey: "password"),
                       savedEmail == email,
                       savedPassword == password {
                        isSignInSuccessful = true
                    } else {
                        isSignInSuccessful = false
                    }
                }) {
                    Text("Entrar")
                        .font(Font.system(size: 22, weight: .bold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                NavigationLink(
                    destination: SignUpView(isSignInActive: $isSignInActive),
                    label: {
                        Text("Criar conta")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding(.bottom, 60)
                    }
                )
                .padding()
            }
            .padding()
        }
    }
}
