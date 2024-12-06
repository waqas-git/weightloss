//
//  MealPlanScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 30/11/2024.
//

import SwiftUI

struct MealPlanScreen: View {
    @State var selectedDay: Int = 0
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var daysOfMonth = Array(1...30)
    var body: some View {
        NavigationView{
            ScrollView (showsIndicators: false){
                VStack{
                    BannerCell(image: "fasting_banner", isButtonEnabled: true)
                    BannerCell(title1: "30 Days", title2: "Meal Plan", subTitle: "Shoping List >", image: "meal_plan", isButtonEnabled: false)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(daysOfMonth, id: \.self) { day in
                            CalendarCell(selectedDay: $selectedDay, day: day)
                                .onTapGesture {
                                    selectedDay = day
                                }
                        }
                    }.padding()
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Text("MEAL PLANS")
                        .fontWeight(.semibold)
                        .font(.title2)
                }
            })
        }
    }
}

#Preview {
    MealPlanScreen()
}
