//
//  ProfileViewModel.swift
//  GymManager
//
//  Created by Никита Яровой on 10.04.2025.
//

import Foundation
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    @Published var member: Member
    
    init(member: Member) {
        self.member = member
    }
}
