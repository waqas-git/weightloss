//
//  ExerciseListViewModifier.swift
//  weightloss
//
//  Created by waqas ahmed on 05/11/2024.
//

import SwiftUI

struct ExerciseListViewModifier: ViewModifier {
    // 2
    func body(content: Content) -> some View {
      content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 7, leading: 20, bottom: 7, trailing: 20)) // Adjust these values as needed
    }
}
