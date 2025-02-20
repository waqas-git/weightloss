//
//  CalendarViewModel.swift
//  weightloss
//
//  Created by waqas ahmed on 16/01/2025.
//

import SwiftUI

class CalendarViewModel : ObservableObject {
    
    @Published var dates: [CalendarDate] = []
    @Published var monthTitle: String = ""
    @Published var selectedDate: Date? = nil
    
    private let calendar = Calendar.current
    private let today = Date()
    private var currentMonth: Date = Date()
    
    let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols

        init() {
            updateMonth(to: today)
        }

        func updateMonth(to date: Date) {
            currentMonth = date
            monthTitle = DateFormatter().monthYearFormatter.string(from: currentMonth)
            generateDates(for: currentMonth)
        }

        func changeMonth(by value: Int) {
            if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
                updateMonth(to: newMonth)
            }
        }

        func generateDates(for month: Date) {
            dates.removeAll()

            guard let monthInterval = calendar.dateInterval(of: .month, for: month) else {return}
                  let startOfMonth = monthInterval.start

            let range = calendar.range(of: .day, in: .month, for: startOfMonth)!

            // Add leading days for the first week
            let firstWeekday = calendar.component(.weekday, from: startOfMonth) - calendar.firstWeekday
            for _ in 0..<firstWeekday {
                dates.append(CalendarDate(date: Date(), isCurrentMonth: false, isToday: false))
            }

            // Add days for the current month
            for day in range {
                if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                    dates.append(
                        CalendarDate(
                            date: date,
                            isCurrentMonth: true,
                            isToday: calendar.isDate(date, inSameDayAs: today)
                        )
                    )
                }
            }
        }

        func selectDate(_ date: CalendarDate) {
            selectedDate = date.date
        }
}


extension DateFormatter {
    var monthYearFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy" // E.g., "Jan 2025"
        return formatter
    }
}
