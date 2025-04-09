//
//  Date+Extension.swift
//  GymManager
//
//  Created by Никита Яровой on 09.04.2025.
//

import Foundation

extension Date {
    func toDayMonthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: self)
    }
    
    func addingMonths(_ months: Int, calendar: Calendar = .current) -> Date {
        let newDate = calendar.date(byAdding: .month, value: months, to: self)
        guard let date = newDate else { return self }
        return date
    }
}
