//
//  BellyFatBurnerView.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct BellyFatBurnerView: View {
    @State var selectedDay: Int = 0
    var body: some View {
        ZStack{
            Color(.systemGray6) // Background color for the list
            .ignoresSafeArea()
            VStack {
                Image("belly-fat-burner")
                    .resizable()
                    .scaledToFill() // Ensures the image fills the specified frame
                    .frame(height: 200) // Specify only the height; width will adjust automatically
                    .cornerRadius(25) // Apply corner radius
                    .padding(.horizontal, 20) // Apply horizontal padding to the image container
                    .clipped() // Clips any overflowing content to fit within the corner radius
                Spacer()
              
                    List {
                        ForEach(1...10, id: \.self){ index in
                            ScheduleCell(day: index, selectedDay: $selectedDay).onTapGesture {
                                selectedDay = index
                            }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .listRowInsets(EdgeInsets(top: 7, leading: 20, bottom: 7, trailing: 20)) // Adjust these values as needed
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
}

#Preview {
    BellyFatBurnerView()
}
