//
//  ChallengeCard.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct ChallengeCard: View {
    let challenge: Challenge
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(challenge.color)
                    .frame(width: 300, height: 250) // Adjust card size
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(challenge.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(challenge.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding()
            }
        }
}

#Preview {
    ChallengeCard(challenge: Challenge.mockChallenges.first!)
}
