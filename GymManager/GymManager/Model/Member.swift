//
//  User.swift
//  GymManager
//
//  Created by Никита Яровой on 07.04.2025.
//

import Foundation

struct Member: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    var isAdmin: Bool 
    let dateOfBirth: Date?
    let dateOfRegistration: Date
    var dateOfLastPayment: Date?
    var profileImageURL: String?
}

extension Member {
    var dateOfBirthString: String {
        guard let dob = dateOfBirth else {
            return "-"
        }
        return dob.toDayMonthYearString()
    }
}
