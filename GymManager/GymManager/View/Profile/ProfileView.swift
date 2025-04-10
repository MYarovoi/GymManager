//
//  ProfileView.swift
//  GymManager
//
//  Created by Никита Яровой on 09.04.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: FirebaseService
    @State var member: Member
    @State private var isEditPresented = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color(.systemGray))
                
                VStack(alignment: .leading) {
                    Text(member.fullName)
                        .font(.title)
                    LabelFactory.build(fieldName: "Участник клубу з:", value: member.dateOfRegistration.toDayMonthYearString())
                    
                    LabelFactory.build(fieldName: "Дата народження:", value: member.dateOfBirthString)
                    
                }
            }.padding(.horizontal)
            
            Text("Абонемент дійсний до: 21.04.2025")
                .font(.subheadline)
                .padding(.horizontal)
            
            ProfileActionButtonView(viewModel: ProfileViewModel(member: member), isPresented: $isEditPresented)
            
            Spacer()
        }
        .sheet(isPresented: $isEditPresented, content: {
            NavigationStack {
                EditProfileView(member: $member)
                                .environmentObject(viewModel)
            }
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Профіль")
                    .font(.headline)
                    .foregroundStyle(Color(ThemeColors.coral))
            }
            
            if member.isCurrentUser {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { try viewModel.signOut() }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .foregroundStyle(Color(ThemeColors.coral))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView(member: Member.MOCK_USER)
}
