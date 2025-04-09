//
//  MemberCell.swift
//  GymManager
//
//  Created by Никита Яровой on 09.04.2025.
//

import SwiftUI

struct MemberCell: View {
    let member: Member
    
    var body: some View {
        HStack(spacing: 8) {
            if let imageURL = member.profileImageURL {
                Image(systemName: imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color(.systemGray))
            }
            
            VStack(alignment: .leading) {
                Text(member.fullName)
                    .font(.headline)
                VStack(alignment: .leading) {
                    Text("Учасник клубу з: \(member.dateOfRegistration.toDayMonthYearString())")
                        .foregroundStyle(Color(.systemGray))
                    
                    if let dolp = member.dateOfLastPayment {
                        Text("Абонемент до: \(dolp.addingMonths(1).toDayMonthYearString())")
                            .foregroundStyle(
                                dolp.addingMonths(1) < Date() ? Color(ThemeColors.softRed) : Color(ThemeColors.coral)
                            )
                    } else {
                        Text("Немає оплат")
                            .foregroundStyle(Color(ThemeColors.softRed))
                    }
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    MemberCell(
        member: Member.MOCK_USER
    )
}
