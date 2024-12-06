//
//  GoalViewModel.swift
//  weightloss
//
//  Created by waqas ahmed on 08/11/2024.
//

import Foundation
import SwiftUICore
class GoalViewModel: ObservableObject {
    
    @Published private(set) var items: [Goal] = []
    
    init() {
            loadItems()
        }
    
    func loadItems() {
        
        items = [
            Goal(name: "Lose full-body weight", icon: "flame.fill"),
            Goal(name: "Burn belly fat", icon: "wind"),
            Goal(name: "Tone butt & thigh", icon: "wind"),
            Goal(name: "Get strong & lean", icon: "figure.walk")
        ]
        animateItems()
    }
    
    // Animate items one by one
        private func animateItems() {
            for index in items.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
                    self.items[index].isAnimate = true
                }
            }
        }
        
        // Toggle item selection
        func toggleSelection(for item: Goal) {
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items[index].isSelected.toggle()
            }
        }
}
