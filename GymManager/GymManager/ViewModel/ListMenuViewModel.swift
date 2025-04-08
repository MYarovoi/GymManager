//
//  ListMenuViewModel.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class ListMenuViewModel: ObservableObject {
    @Published var menuItems = [ListItem]()
    
    init() {
        Task {
            try await fetchLists()
        }
    }
    
    private func fetchLists() async throws {
        do {
            let snapshot = try await COLLECTION_ALL_USERS.getDocuments()
            menuItems = snapshot.documents.compactMap { try? $0.data(as: ListItem.self) }
        } catch {
            print("DEBUG: Error fetching all lists: \(error.localizedDescription)")
        }
    }
}
