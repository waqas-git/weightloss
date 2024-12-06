//
//  FullBodyWeightLossView.swift
//  weightloss
//
//  Created by waqas ahmed on 05/11/2024.
//

import SwiftUI

struct FullBodyWeightLossView: View{
    
    @State var selectedDay: Int = 0
    var body: some View {
        ZStack{
            Color(.systemGray6) // Background color for the list
            .ignoresSafeArea()
            ScrollView{
            VStack {
                    BannerImage(image: "full-body")
                    Spacer()
                VStack {
                        ForEach(1...10, id: \.self){ index in
                            ScheduleCell(day: index, selectedDay: $selectedDay).onTapGesture {
                                selectedDay = index
                            }
                            .modifier(ExerciseListViewModifier())
                        }
                    }
                }
            }
            }
        }
}

#Preview {
    FullBodyWeightLossView()
}
