//
//  CustomEditProfileTextField.swift
//  GymManager
//
//  Created by Никита Яровой on 10.04.2025.
//

import SwiftUI

struct CustomEditProfileTextField: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                    .foregroundStyle(Color(.systemGray3))
                    .font(.caption)
            TextField("", text: text)
                .tint(.white)
                    .foregroundStyle(Color(.white))
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color(ThemeColors.darkBlue))
            .cornerRadius(8)
    }
}

#Preview {
    CustomEditProfileTextField(title: "Повне ім'я", text: .constant("Mykyta"))
}
