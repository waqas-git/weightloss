//
//  ContentView.swift
//  weightloss
//
//  Created by waqas ahmed on 09/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isGoalViewsPresented: Bool = true
    var body: some View {
        if(isGoalViewsPresented){
            GoalsScreen(isGoalViewsPresented: $isGoalViewsPresented)
        }else{
            FitnessTabView()
        }
    }
}

#Preview {
    ContentView()
}
