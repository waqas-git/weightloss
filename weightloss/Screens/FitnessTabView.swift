//
//  FitnessTabView.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct FitnessTabView: View {
    var body: some View {
        TabView {
            MealPlanScreen().tabItem {
                Image(systemName: "fork.knife")
                Text("Meal Plans")
            }
            
            DiscoverScreen().tabItem {
                Image(systemName: "gauge.with.needle")
                Text("Discover")
            }
            
            TrainingScreen().tabItem {
                Image(systemName: "dumbbell")
                Text("Training")
            }
            
            ReportScreen().tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Report")
            }
            
            ProfileScreen().tabItem {
                Image(systemName: "person.fill")
                Text("Me")
            }
        }
    }
}

#Preview {
    FitnessTabView()
}
