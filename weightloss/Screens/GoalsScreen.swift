//
//  GoalsScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 08/11/2024.
//

import SwiftUI

struct GoalsScreen: View {
    @StateObject private var viewModel = GoalViewModel()
    @Binding var isGoalViewsPresented : Bool
    var body: some View {
        VStack(spacing: 16) {
            Text("What's your goal?")
                .font(.title)
                .bold()
                .padding(.top, 20)
            
            Spacer()
            
            List{
                ForEach(viewModel.items) { item in
                    GoalsCell(item: item)
                        .onTapGesture {
                            viewModel.toggleSelection(for: item)
                        }.modifier(ExerciseListViewModifier())
                }
            }
            .listStyle(.plain)
            .frame(maxHeight: CGFloat(viewModel.items.count * 80))
                        
            Button(action: {
                isGoalViewsPresented = false
            }) {
                Text("NEXT")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
       // .padding(.horizontal)
    }
}

#Preview {
    GoalsScreen(isGoalViewsPresented: .constant(true))
}
