//
//  TextLabelFactory.swift
//  GymManager
//
//  Created by Никита Яровой on 09.04.2025.
//

import SwiftUI

struct LabelFactory {
    static func build(fieldName: String, value: String) -> some View {
        HStack {
            Text(fieldName)
                .fontWeight(.semibold)
            Text(value)
        }
    }
}
