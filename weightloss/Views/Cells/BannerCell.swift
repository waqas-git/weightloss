//
//  BannerCell.swift
//  weightloss
//
//  Created by waqas ahmed on 30/11/2024.
//

import SwiftUI

struct BannerCell: View {
    var title1: String = "16:8 Intermittent"
    var title2: String = "Fasting"
    var subTitle: String = "Lose weight with no deit"
    var image: String = "meal_plan"
    var isButtonEnabled: Bool = false
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    Text(title1)
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                    
                    Text(title2)
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                    
                    Text(subTitle)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .padding(.top, 2)
                }
                .padding(.leading, 10)
                Spacer()
                
                if isButtonEnabled {
                    Button(action: {
                        //print("Start Day \(day)")
                    }) {
                        Text("Start")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: 45, height: 20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .foregroundColor(Color.primary)
                            .cornerRadius(12)
                    }
                }
            }
        }
        .padding()
        .background(
            Image(image)
             .resizable()
             .frame(maxWidth: .infinity, maxHeight: 200)
             .cornerRadius(20)
             .padding(.horizontal, 10)
             .clipped()
        )
    }
}

#Preview {
    BannerCell(isButtonEnabled: true)
}
