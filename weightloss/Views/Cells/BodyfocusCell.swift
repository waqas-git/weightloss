//
//  BodyfocusCell.swift
//  weightloss
//
//  Created by waqas ahmed on 04/12/2024.
//

import SwiftUI

struct BodyfocusCell: View {
    var title: String = "Bodyfocus"
    var image: String = "without_bg"
    var viewHeight: CGFloat = 200
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.pink.opacity(0.15))
                .overlay {
                    HStack{
                        VStack{
                            Spacer()
                            Text(title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding()
                        }
                        Spacer()
                        Image(image)
                            .resizable()
                            
                    }
                }
        }
        .frame(height: viewHeight)
    }
}

#Preview {
    BodyfocusCell()
}
