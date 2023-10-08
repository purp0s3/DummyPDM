//
//  UserProfileView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 08/10/23.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack {
            Text("Perfil") // Title
                .font(.largeTitle)
                .foregroundStyle(

                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )                
                .shadow(radius: 3)
                .padding()

            Image(systemName: "person.circle.fill") // Placeholder image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .padding()

            Text("Nome: Francisco Pereira")
                .font(.headline)
                .padding()

            Text("Telefone: +55 (11) 96490-9693")
                .font(.headline)
                .padding()
        }
        
     .padding()
        
    }
}
