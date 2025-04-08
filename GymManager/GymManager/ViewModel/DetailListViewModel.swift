//
//  DetailListViewModel.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import Foundation
import Firebase

@MainActor
class DetailListViewModel: ObservableObject {
    var link: CollectionReference
    @Published var members = [User]()
    
    init(link: CollectionReference) {
        self.link = link
        
        Task {
            try await fetchMembers(link: link)
        }
    }
    
    func fetchMembers(link: CollectionReference) async throws {
        do {
            let snapshot = try await link.getDocuments()
            print(snapshot)
            members = snapshot.documents.compactMap { try? $0.data(as: User.self) }
            print(members)
        } catch {
            print("DEBUG: Error fetching members \(error.localizedDescription)")
        }
    }
}
