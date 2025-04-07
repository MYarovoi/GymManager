//
//  ContentView.swift
//  GymManager
//
//  Created by Никита Яровой on 01.04.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                Text("Hello!")

            } else {
                LoginView()

            }
        }
    }
}

#Preview {
    ContentView()
}
