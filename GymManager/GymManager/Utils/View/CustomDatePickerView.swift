//
//  CustomDatePickerView.swift
//  GymManager
//
//  Created by Никита Яровой on 10.04.2025.
//

import SwiftUI

struct CustomDatePickerView: View {
    var title: String
    var selection: Binding<Date>
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.trailing)
            
            Spacer()
            
            DatePicker("", selection: selection, in: ...Date(), displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(.compact)
                .background(Color(.white))
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color(ThemeColors.darkBlue))
        .cornerRadius(8)
    }
}

#Preview {
    CustomDatePickerView(title: "Дата народжения", selection: .constant(Date()))
}
