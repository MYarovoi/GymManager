//
//  AllClubMembersView.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import SwiftUI

struct DetailListView: View {
    let list: ListItem
    @EnvironmentObject var service: FirebaseService
    @StateObject var viewModel: DetailListViewModel
    @State private var search: String = ""
    
    init(list: ListItem) {
        self .list = list
        
        guard let id = list.id else {
            fatalError("DEBUG: ListItem must have id!")
        }
        
        _viewModel = StateObject(wrappedValue: DetailListViewModel(link: COLLECTION_ALL_USERS.document(id).collection("\(id)Collection")))
    }
    
    private func deleteUser(_ offsets: IndexSet) async {
        for index in offsets {
            guard let listID = list.id else { return }
            let memberToDelete = viewModel.members[index]
            let collectionRef = COLLECTION_ALL_USERS
                .document(listID)
                .collection("\(listID)Collection")
            do {
                try await service.deleteUser(collectionRef, id: memberToDelete.id)
                viewModel.members.remove(at: index)
            } catch {
                print("DEBUG: Ошибка удаления пользователя \(memberToDelete.id): \(error)")
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(viewModel.members) { member in
                MemberCell(member: member)
            }.onDelete { offsets in
                Task {
                    await deleteUser(offsets)
                }
            }
        }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(list.listName)
                        .font(.headline)
                        .foregroundStyle(Color(ThemeColors.coral))
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundStyle(Color(ThemeColors.coral))
                }
            }
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
    }
}
