//
//  CalendarCell.swift
//  weightloss
//
//  Created by waqas ahmed on 30/11/2024.
//

import SwiftUI

struct CalendarCell: View {
    @Binding var selectedDay: Int
    var day : Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
                .shadow(color: .clear, radius: 4)
                .frame(height: 80)
                .overlay(
                    Text("Day \(day)")
                        .font(.headline)
                        .foregroundColor(selectedDay == day ? .green : .black)
                )
            
            // Green Side Bar
            if selectedDay == day {
                Triangle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .offset(x: 0, y: 60)
            }
        }
        //.padding()
    }
}

#Preview {
    CalendarCell(selectedDay: .constant(1), day: 1)
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY)) // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom-right corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom-left corner
        path.closeSubpath()
        return path
    }
}
