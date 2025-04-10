//
//  ScheduleView.swift
//  GymManager
//
//  Created by Никита Яровой on 08.04.2025.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Розклад")
                    .font(.headline)
                    .foregroundStyle(Color(ThemeColors.coral))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ScheduleView()
}
