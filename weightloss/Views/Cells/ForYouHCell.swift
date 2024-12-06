//
//  ForYouHCell.swift
//  weightloss
//
//  Created by waqas ahmed on 02/12/2024.
//

import SwiftUI

struct ForYouHCell: View {
    var image: String
    var title: String
    var subTitle: String
    var body: some View {
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding(.bottom, 3)
                    
                    Text(subTitle)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                 
                        Rectangle()
                            .fill(Color.secondary.opacity(0.5))
                            .frame(width: .infinity, height: 1)
                            .offset(y: 15) // Place rectangle below text
                }
                .padding(.horizontal, 5)
                
                Spacer()
            }
    }
}

#Preview {
    ForYouHCell(image: "back_workout", title: "Full back workout", subTitle: "10 min. Beginner")
}
