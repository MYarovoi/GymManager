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
    @Published var members = [Member]()
    
    init(link: CollectionReference) {
        self.link = link
        
        Task {
            try await fetchMembers(link: link)
        }
    }
    
    func filteredUsers(_ query: String) -> [Member] {
        let lowercasedQuery = query.lowercased()
        return members.filter({
            $0.fullName.lowercased().contains(lowercasedQuery)
        })
    }
    
    func fetchMembers(link: CollectionReference) async throws {
        do {
            let snapshot = try await link.getDocuments()
            members = snapshot.documents.compactMap { try? $0.data(as: Member.self) }
        } catch {
            print("DEBUG: Error fetching members \(error.localizedDescription)")
        }
    }
}
