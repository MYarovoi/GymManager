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
            
            ProfileActionButtonView(viewModel: ProfileViewModel(member: member))
            
            Spacer()
        }
        .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Профіль")
                        .font(.headline)
                        .foregroundStyle(Color(ThemeColors.coral))
                    
                    Button {
                        Task {
                            try viewModel.signOut()
                        }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
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

#Preview {
    ProfileView(member: Member.MOCK_USER)
}
