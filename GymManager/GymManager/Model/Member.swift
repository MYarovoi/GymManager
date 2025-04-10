//
//  User.swift
//  GymManager
//
//  Created by Никита Яровой on 07.04.2025.
//

import Foundation
import FirebaseAuth

struct Member: Identifiable, Codable, Hashable {
    let id: String
    var fullName: String
    let email: String
    var isAdmin: Bool
    var dateOfBirth: Date?
    var dateOfRegistration: Date
    var dateOfLastPayment: Date?
    var profileImageURL: String?
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension Member {
    var dateOfBirthString: String {
        guard let dob = dateOfBirth else {
            return "-"
        }
        return dob.toDayMonthYearString()
    }
    
    static let MOCK_USER: Member = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dor = formatter.date(from: "2025-04-08")!
        let dob = formatter.date(from: "1996-09-13")!
        let dolp = formatter.date(from: "2025-03-10")!
            return Member(
                id: "",
                fullName: "Mykyta Yarovoi",
                email: "MykytaYarovoi@gmail.com",
                isAdmin: false,
                dateOfBirth: dob,
                dateOfRegistration: dor,
                dateOfLastPayment: dolp
            )
        }()
}
