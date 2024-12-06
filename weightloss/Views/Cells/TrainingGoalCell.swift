//
//  TrainingGoalCell.swift
//  weightloss
//
//  Created by waqas ahmed on 03/12/2024.
//

import SwiftUI

struct TrainingGoalCell: View {
    var title: String
    var image: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.leading, 10)
                .padding(.top, 10)
            
            Image(image)
                .resizable()
        }
        .cornerRadius(10)
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    TrainingGoalCell(title: "Fat Burning", image: "single_image")
}
