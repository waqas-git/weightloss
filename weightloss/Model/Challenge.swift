//
//  Challenge.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import Foundation
import SwiftUICore

struct Challenge: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
    
    
    
    public static let mockChallenges: [Challenge] = [
        Challenge(title: "FULL BODY 7X4 CHALLENGE",
                  description: "Start your body-toning journey to target all muscle groups and build your dream body in 4 weeks!",
                  color: .blue),
        Challenge(title: "LOWER BODY 4X4 CHALLENGE",
                  description: "In just 4 weeks, strengthen your lower body and boost endurance!",
                  color: .purple),
        Challenge(title: "UPPER BODY 4X4 CHALLENGE",
                  description: "Focus on upper body strength and conditioning.",
                  color: .green),
        Challenge(title: "CORE 4X4 CHALLENGE",
                  description: "Build core strength and stability in 4 weeks.",
                  color: .orange)
    ]
}
