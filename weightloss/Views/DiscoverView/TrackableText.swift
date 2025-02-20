//
//  TrackableText.swift
//  weightloss
//
//  Created by waqas ahmed on 07/12/2024.
//

import SwiftUI

struct TrackableText: View {
    @Binding var currentTitle: String
    let title: String
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.primary)
            .padding(.leading, 10)
            .padding(.top, 20)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onChange(of: geometry.frame(in: .global).minY) { oldValue, newValue in
                            // Check if the title is in view
                            if newValue < 100 && newValue > 0 { // Adjust thresholds as needed
                                currentTitle = title
                            }
                        }
                }
            )
    }
}

#Preview {
    //TrackableText()
}
