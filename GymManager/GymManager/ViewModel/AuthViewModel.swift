//
//  AuthViewModel.swift
//  GymManager
//
//  Created by Никита Яровой on 07.04.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        Task {
            try await fetchUser()
        }
    }
    
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            self.userSession = result.user
            try await self.fetchUser()
        } catch {
            print("DEBUG: Error logging in: \(error.localizedDescription)")
        }
    }
    
    func registerUser(email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            let data: [String: Any?] = ["email": email,
                        "fullName": fullName,
                        "id": result.user.uid,
                        "dateOfBirth": NSNull(),
                        "dateOfRegistration": Date(),
                        "dateOfLastPayment": NSNull(),
                        "profileImageURL": NSNull(),
                        "isAdmin": false]
            
            try await COLLECTION_ALL_USERS.document("allClubMembers").collection("allClubMembersCollection").document(result.user.uid).setData(data as [String : Any])
            
            self.userSession = result.user
            try await self.fetchUser()
        } catch {
            print("DEBUG: Error registering user: \(error.localizedDescription)")
        }
    }
    
    func signOut() throws {
        userSession = nil
        user = nil
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out: \(error.localizedDescription)")
        }
        
    }
    
    func fetchUser() async throws {
        guard let uid = userSession?.uid else { return }
        
        do {
            let snapshot = try await COLLECTION_ALL_USERS.document("allClubMembers").collection("allClubMembersCollection").document(uid).getDocument()
            
            let user = try snapshot.data(as: User.self)
            self.user = user
        } catch {
            print("DEBUG: Error fetching user: \(error.localizedDescription)")
        }
    }
}
