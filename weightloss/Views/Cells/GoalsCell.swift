//
//  GoalsCell.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import SwiftUI

struct GoalsCell: View {
    var item: Goal
    var body: some View {
               HStack {
                   Image(systemName: item.icon) // Replace with custom icons as needed
                       .font(.title2)
                   Text(item.name)
                       .font(.headline)
                       .foregroundColor(item.isSelected ? .white : .black)
                   Spacer()
               }
               .padding()
               .frame(maxWidth: .infinity)
               .background(
                            item.isSelected ?
                            Color.pink.opacity(0.1) : Color.white
               ).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(item.isSelected  ? Color.pink : Color.clear, lineWidth: 2)
            )
               .cornerRadius(10)
               .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
           }
    }

#Preview {
    GoalsCell(item: Goal(name: "Lose Weight", icon: "scalemass.fill", isSelected: false, isAnimate: true))
}
