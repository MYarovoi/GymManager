//
//  EditProfileView.swift
//  GymManager
//
//  Created by Никита Яровой on 10.04.2025.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: FirebaseService
    @Binding var member: Member
    @State private var fullName: String
    @State private var dateOfBirth: Date
    @State private var dateOfRegistration: Date

    init (member: Binding<Member>) {
        self._member = member
        _fullName = State(initialValue: member.wrappedValue.fullName)
        _dateOfBirth = State(initialValue: member.wrappedValue.dateOfBirth ?? Date())
        _dateOfRegistration = State(initialValue: member.wrappedValue.dateOfRegistration)
    }
    
    var body: some View {
        VStack {
            TextField("Повне ім'я", text: $fullName)
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        var updatedMember = member
                        updatedMember.fullName = fullName
                        await viewModel.updateMember(member: updatedMember)
                        
                        member = updatedMember
                    }
                    dismiss()
                } label: {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 28, height: 28)
                        .padding(.leading)
                        .foregroundStyle(Color(ThemeColors.coral))
                }
            }
        }
    }
}
