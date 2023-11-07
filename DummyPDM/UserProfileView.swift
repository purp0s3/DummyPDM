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

            Image(systemName: "person.circle.fill") // Placeholder
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .padding()

            // Display
            if let userName = UserDefaults.standard.string(forKey: "name"),
               let userEmail = UserDefaults.standard.string(forKey: "email") {
                Text("Nome: \(userName)")
                    .font(.headline)
                    .padding()

                Text("Email: \(userEmail)")
                    .font(.headline)
                    .padding()
            }
        }
        .padding()
    }
}

