//
//  ListItem.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import Foundation
import FirebaseFirestore

struct ListItem: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    
    var listName: String {
        switch id {
            case "allClubMembers":
            return "Загальний список клубу"
        case "paidMembership":
            return "Сплачені абонементи на місяць"
        default:
            return id ?? ""
        }
    }
}
