//
//  LeanBodybuildingView.swift
//  weightloss
//
//  Created by waqas ahmed on 05/11/2024.
//

import SwiftUI

struct LeanBodybuildingView: View {
        @State var selectedDay: Int = 0
        var body: some View {
            ZStack{
                Color(.systemGray6) // Background color for the list
                .ignoresSafeArea()
                VStack {
                    BannerImage(image: "lean")
                    Spacer()
                        List {
                            ForEach(1...10, id: \.self){ index in
                                ScheduleCell(day: index, selectedDay: $selectedDay).onTapGesture {
                                    selectedDay = index
                                }
                                .modifier(ExerciseListViewModifier())
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
}

#Preview {
    LeanBodybuildingView()
}
