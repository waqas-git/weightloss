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
    @State private var currentTitle: String = "Discover" // Track current title
    @State private var scrollDirection: ScrollDirection = .none
    enum ScrollDirection {
        case up, down, none
    }
    
    @State private var lastScrollOffset: CGFloat = 0
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    BannerCell(title1: "Slime down", title2: "your face", subTitle: "Reduce cheek fat, get face \nslimmed down", image: "slim_down_face", isButtonEnabled: false)
                    
                    TrackableText(currentTitle: $currentTitle, title: "Relax")
                    HorizontalScrollView(
                        items: viewModel.relaxStretchItems,
                        cellWidth: UIScreen.main.bounds.width / 2.5,
                        height: 160
                    ) { item in
                        ExerciseHCell(image: item.icon, title: item.name)
                    }
                    
                    TrackableText(currentTitle: $currentTitle, title: "Picks for you")
                    HorizontalListWithItems(
                        items: viewModel.foryouItems,
                        rows: foryouRows,
                        cellWidth: UIScreen.main.bounds.width / 1.15,
                        height: 360
                    ) { item in
                            ForYouHCell(image: item.icon, title: item.title, subTitle: item.subtitle ?? "")
                    }
                    
                    TrackableText(currentTitle: $currentTitle, title: "Lose weight")
                    HorizontalScrollView(
                        items: viewModel.relaxStretchItems,
                        cellWidth: UIScreen.main.bounds.width / 2.4,
                        height: 220
                    ) { item in
                        ExerciseHCell(image: item.icon, title: item.name, imageHeight: UIScreen.main.bounds.width / 2.4)
                    }
                    TrackableText(currentTitle: $currentTitle, title: "Belly fat burner")
                    HorizontalListWithItems(
                        items: viewModel.foryouItems,
                        rows: bellyFatRows,
                        cellWidth: UIScreen.main.bounds.width / 1.15,
                        height: 240
                    ) { item in
                            ForYouHCell(image: item.icon, title: item.title, subTitle: item.subtitle ?? "")
                    }
                    TrackableText(currentTitle: $currentTitle, title: "Training Goal")
                    HorizontalScrollView(
                        items: viewModel.trainingGoalsItems,
                        cellWidth: UIScreen.main.bounds.width / 2.5,
                        height: 200
                    ) { item in
                        TrainingGoalCell(title: item.name, image: item.icon)
                            .cornerRadius(10)
                    }
                    
                    TrackableText(currentTitle: $currentTitle, title: "Body focus")
//                    GeometryReader { geometry in
//                        let cellWidth = geometry.size.width / 2.25
//                        
//                        LazyVGrid(columns: bellyFatRows, spacing: 10) { // Adjust spacing as needed
//                            ForEach(viewModel.focusGridItems, id: \.self) { item in
//                                BodyfocusCell(title: item.name, image: item.icon)
//                                    .frame(width: cellWidth, height: cellWidth)
//                            }
//                        }
//                        .padding() // Optional padding around the list
//                    }
//                    .frame(height: 400) // Adjust height to fit your content
                    
                    HorizontalListWithItems(
                        items: viewModel.focusGridItems,
                        rows: bellyFatRows,
                        cellWidth: UIScreen.main.bounds.width / 2.25,
                        height: 400
                    ) { item in
                        BodyfocusCell(title: item.name, image: item.icon, viewHeight: UIScreen.main.bounds.width / 2.25)
                    }
                    
                    VStack{
                        List{
                            ForEach(viewModel.durationAndIntensityItems, id: \.self){ section in
                                Section(header: Text(section.title ?? "No title").font(.title3).fontWeight(.semibold).foregroundStyle(Color.primary)) {
                                    ForEach(section.items, id: \.self){item in
                                        ProfileItemCell(item: item)
                                    }
                                }
                            }
                            .textCase(nil) // Prevents the section header from being capitalized
                        }
                        .frame(height: 400)
                        .listStyle(InsetGroupedListStyle()) // Optional: Customizes the list style to match iOS style
                    }
                    
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(currentTitle)
                        .fontWeight(.semibold)
                        .font(.title2)
                    // .animation(.smooth, value: currentTitle)
                }
            }
        }
    }
}

#Preview {
    DiscoverScreen()
}


