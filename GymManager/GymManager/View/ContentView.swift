//
//  ContentView.swift
//  GymManager
//
//  Created by Никита Яровой on 01.04.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedIndex: Int = 0
    
    private var titleForIndex: String {
        switch selectedIndex {
        case 0: return "Учасники клубу"
        case 1: return "Розклад"
        default: return ""
        }
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationStack{
                    TabView(selection: $selectedIndex) {
                        ListMenuView()
                            .tabItem {
                                Image(systemName: "list.clipboard")
                                Text("Абонементи")
                            }.tag(0)
                        
                        ScheduleView()
                            .tabItem {
                                Image(systemName: "calendar.badge.clock")
                                Text("Розклад")
                            }.tag(1)
                        
                        //                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }.tag(2)
                    }
                    .tint(Color(ThemeColors.coral))
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                                            Text(self.titleForIndex)
                                                .font(.headline)
                                                .foregroundStyle(Color(ThemeColors.coral))
                                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                Task {
                                    try viewModel.signOut()
                                }
                            } label: {
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 28, height: 28)
                                    .padding(.leading)
                                    .foregroundStyle(Color(ThemeColors.coral))
                            }
                            
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}
