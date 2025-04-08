//
//  AllClubMembersView.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import SwiftUI

struct DetailListView: View {
    let list: ListItem
    @StateObject var viewModel: DetailListViewModel
    @State private var search: String = ""
    
    init(list: ListItem) {
        self .list = list
        
        guard let id = list.id else {
            fatalError("DEBUG: ListItem must have id!")
        }
        
        _viewModel = StateObject(wrappedValue: DetailListViewModel(link: COLLECTION_ALL_USERS.document(id).collection("\(id)Collection")))
    }
    
    var body: some View {
            List(viewModel.members) { member in
                Text(member.fullName)
            }
        .navigationTitle(list.listName)
        .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
    }
}
