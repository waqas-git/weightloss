//
//  ExerciseHCell.swift
//  weightloss
//
//  Created by waqas ahmed on 02/12/2024.
//

import SwiftUI

struct ExerciseHCell: View {
    var image: String
    var title: String
    var imageHeight: CGFloat = 120
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(height: imageHeight)
                .cornerRadius(10)
                .clipped()
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(2) // Allow up to 2 lines of text
                .fixedSize(horizontal: false, vertical: true) // Wrap text to fit vertically
        }
    }
}

#Preview {
    ExerciseHCell(image: "relax_4", title: "Full body \nstretching")
}
