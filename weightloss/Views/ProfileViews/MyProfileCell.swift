//
//  MyProfileCell.swift
//  weightloss
//
//  Created by waqas ahmed on 06/02/2025.
//
import SwiftUI
struct MyProfileCell : View {
    var topTitle: String = "title"
    var selectedValue: String = "selectdValue"
    var body: some View {
        HStack{
            Text(topTitle)
                .font(.system(size: 24, weight: .medium))
            
            Spacer()
            
            Text(selectedValue)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(.gray))
                .padding()
            
            Image(systemName: "pencil")
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(Color(.darkGray))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
