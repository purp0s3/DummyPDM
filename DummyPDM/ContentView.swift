//
//  ContentView.swift
//  DummyPDM
//
//  Created by Lucas Nascimento on 07/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isSignInActive = true

    var body: some View {
        if isSignInActive {
            SignInView(isSignInActive: $isSignInActive)
        } else {
            UserProfileView()
        }
    }
}
