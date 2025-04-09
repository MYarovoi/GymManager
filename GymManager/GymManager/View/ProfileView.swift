//
//  ProfileView.swift
//  GymManager
//
//  Created by Никита Яровой on 09.04.2025.
//

import SwiftUI

struct ProfileView: View {
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
                .padding(.leading)
            
            HStack {
                Button("Редагувати профіль") {
                    
                }
                .frame(width: 180, height: 45)
                .foregroundStyle(Color(.white))
                .background(Color(ThemeColors.coral))
                .font(.system(size: 15, weight: .semibold))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button("Придбати абонемент") {
                    
                }
                .frame(width: 180, height: 45)
                .foregroundStyle(Color(.white))
                .background(Color(ThemeColors.coral))
                .font(.system(size: 15, weight: .semibold))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView(member: Member.MOCK_USER)
}
