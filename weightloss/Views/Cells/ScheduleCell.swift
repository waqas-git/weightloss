//
//  ScheduleCell.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct ScheduleCell: View {
    var day : Int
    var exercises: String = "14 Exercises"
    @Binding var selectedDay: Int // Bind to selected day from parent view
        
        var isSelected: Bool {
            selectedDay == day
        }
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Day")
                        .font(.title2)
                        .foregroundColor(isSelected ? .white : .black)
                    
                    Text(day < 10 ? "0\(day)" :"\(day)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isSelected ? .white : .black)
                }
                VStack(alignment: .leading, spacing: 5){
                    // Text with underline rectangle
                    Text(exercises)
                        .font(.title2)
                        .foregroundColor(isSelected ? .white : .black)
                        .background(
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(isSelected ? Color.white.opacity(0.8) : Color.secondary.opacity(0.8))
                                    .frame(width: geometry.size.width, height: 2)
                                    .offset(y: geometry.size.height + 4) // Place rectangle below text
                            }
                        )
                }.padding(.leading, 20)
                
                Spacer()
                
                if isSelected {
                    Button(action: {
                        print("Start Day \(day)")
                    }) {
                        Text("Start")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: 45, height: 20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .foregroundColor(Color.red)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .padding()
        .background(
            ZStack {
            Color.white // Default background for unselected cells            
            if isSelected {
                LinearGradient(
                    gradient: Gradient(colors: [Color.red.opacity(0.8), Color.pink.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
        }
    )
    .cornerRadius(25)
    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)        
    }
}

#Preview {
    ScheduleCell(day: 02, exercises: "14 Exercises", selectedDay: .constant(2))
}
