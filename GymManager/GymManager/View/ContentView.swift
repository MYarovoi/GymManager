//
//  ContentView.swift
//  GymManager
//
//  Created by Никита Яровой on 01.04.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: FirebaseService
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                TabView(selection: $selectedIndex) {
                    NavigationStack{
                        ListMenuView()
                    }
                    .tabItem {
                        Image(systemName: "list.clipboard")
                        Text("Абонементи")
                    }.tag(0)
                    
                    NavigationStack{
                        ScheduleView()
                    }
                    .tabItem {
                        Image(systemName: "calendar.badge.clock")
                        Text("Розклад")
                    }.tag(1)
                    
                    
                    if let user = viewModel.user {
                        NavigationStack{
                            ProfileView(member: user)
                        }
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Профіль")
                        }.tag(2)
                    }
                }
                .tint(Color(ThemeColors.coral))
            } else {
                LoginView()
            }
        }
    }
}
