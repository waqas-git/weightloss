//
//  CalendarCellReport.swift
//  weightloss
//
//  Created by waqas ahmed on 16/01/2025.
//
import SwiftUI

struct CalendarCellReport: View {
    let date: CalendarDate

    var body: some View {
        Text(date.isCurrentMonth ? "\(Calendar.current.component(.day, from: date.date))" : "")
            .font(.body)
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(date.isToday ? Color.black : Color.clear)
            .cornerRadius(20)
            .foregroundColor(date.isToday ? .white : .gray)
    }
}
