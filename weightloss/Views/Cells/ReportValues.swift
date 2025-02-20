//
//  ReportValues.swift
//  weightloss
//
//  Created by waqas ahmed on 11/01/2025.
//

import SwiftUI

struct ReportValues : View{
    var value: Int = 0
    var title: String = "Workout"
    var body: some View{
        VStack{
            Text("\(value)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.green)
            
            Text(title)
                .font(.subheadline)
        }
        .padding()
    }
}

#Preview {
    ReportValues()
}
