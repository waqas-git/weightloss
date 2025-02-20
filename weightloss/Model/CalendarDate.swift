//
//  CalendarDate.swift
//  weightloss
//
//  Created by waqas ahmed on 16/01/2025.
//

import Foundation
struct CalendarDate : Identifiable{
    var id = UUID()
    var date : Date
    var isCurrentMonth: Bool
    var isToday: Bool
}
