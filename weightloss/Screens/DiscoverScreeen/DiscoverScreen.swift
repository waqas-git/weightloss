//
//  DiscoverScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 02/12/2024.
//

import SwiftUI

struct DiscoverScreen: View {
    // Define 3 rows for the LazyHGrid
    let foryouRows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let bellyFatRows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject private var viewModel = DiscoverViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    BannerCell(title1: "Slime down", title2: "your face", subTitle: "Reduce cheek fat, get face \nslimmed down", image: "slim_down_face", isButtonEnabled: false)
                    
                    Text("Relax")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    GeometryReader { geometry in
                        let cellWidth = geometry.size.width / 2.5
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) { // Adjust spacing as needed
                                ForEach(viewModel.relaxStretchItems, id: \.self) { item in
                                    ExerciseHCell(image: item.icon, title: item.name)
                                        .frame(width: cellWidth)
                                }
                            }
                            .padding(.horizontal, 10) // Optional padding around the list
                        }
                    }
                    .frame(height: 160) // Adjust height to fit your content
                    
                    Text("Picks for you")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    GeometryReader{ geometry in
                        let cellwidth = geometry.size.width / 1.15
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: foryouRows, spacing: 10) {
                                ForEach(viewModel.foryouItems, id: \.self) { item in
                                    ForYouHCell(image: item.icon, title: item.title, subTitle: item.subtitle ?? "")
                                        .frame(width: cellwidth)
                                }
                            }
                            .padding(10)
                        }
                        
                    }.frame(height: 360) // Set the height to fit 3 rows
                    
                    Text("Lose weight")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    GeometryReader { geometry in
                        let cellWidth = geometry.size.width / 2.4
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) { // Adjust spacing as needed
                                ForEach(viewModel.relaxStretchItems, id: \.self) { item in
                                    ExerciseHCell(image: item.icon, title: item.name, imageHeight: cellWidth)
                                        .frame(width: cellWidth)
                                }
                            }
                            .padding(.horizontal, 10) // Optional padding around the list
                        }
                    }
                    .frame(height: 220) // Adjust height to fit your content
                    
                    Text("Belly fat burner")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 40)
                    
                    GeometryReader{ geometry in
                        let cellwidth = geometry.size.width / 1.15
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: bellyFatRows, spacing: 10) {
                                ForEach(viewModel.foryouItems, id: \.self) { item in
                                    ForYouHCell(image: item.icon, title: item.title, subTitle: item.subtitle ?? "")
                                        .frame(width: cellwidth)
                                }
                            }
                            .padding(10)
                        }
                        
                    }.frame(height: 240) // Set the height to fit 3 rows
                    
                    Text("Lose weight")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    GeometryReader { geometry in
                        let cellWidth = geometry.size.width / 2.5
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) { // Adjust spacing as needed
                                ForEach(viewModel.trainingGoalsItems, id: \.self) { item in
                                    TrainingGoalCell(title: item.name, image: item.icon)
                                        .frame(width: cellWidth)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal, 10) // Optional padding around the list
                        }
                    }
                    .frame(height: 200) // Adjust height to fit your content
                    
                    Text("Body focus")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.leading, 10)
                        .padding(.top, 20)
                    
                    GeometryReader { geometry in
                        let cellWidth = geometry.size.width / 2.25
                        
                        LazyVGrid(columns: bellyFatRows, spacing: 10) { // Adjust spacing as needed
                            ForEach(viewModel.focusGridItems, id: \.self) { item in
                                BodyfocusCell(title: item.name, image: item.icon)
                                    .frame(width: cellWidth, height: cellWidth)
                            }
                        }
                        .padding() // Optional padding around the list
                    }
                    .frame(height: 400) // Adjust height to fit your content
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Discover")
                        .fontWeight(.semibold)
                        .font(.title2)
                }
            }
        }
    }
}

#Preview {
    DiscoverScreen()
}
