//
//  ListMenuView.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import SwiftUI

struct ListMenuView: View {
    @StateObject var viewModel = ListMenuViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.menuItems) { list in
                NavigationLink(value: list) {
                    Text(list.listName)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Списки клубу")
                        .font(.headline)
                        .foregroundStyle(Color(ThemeColors.coral))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ListItem.self) { list in
                DetailListView(list: list)
            }
        }
    }
}
