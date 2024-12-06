//
//  TrainingScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct TrainingScreen: View {
    @State private var selectedIndex = 0
    @State private var isShowingTrainingOptions = false
    @State var selectedDay: Int = 0
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedItem: Item? // Selected item to display in the nav bar
    
    let items = [ Item(id: 1, name: "Full Body", image: "full-body"),
                  Item(id: 2, name: "Lean Bodybuilding", image: "lean"),
                  Item(id: 3, name: "Thigh Toning", image: "thigh"),
                  Item(id: 4, name: "Belly Fat Burner", image: "belly-fat")]

    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(alignment: .center, spacing: 20){
                    GeometryReader { geometry in
                        let bannerWidth = geometry.size.width * 0.8
                        let sidePadding = (geometry.size.width - bannerWidth) / 4
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<items.count, id: \.self) { index in
                                    BannerImage(image: items[index].image, width: bannerWidth)
                                        .onTapGesture {
                                            print(index)
                                            withAnimation {
                                                scrollOffset = CGFloat(index) * (bannerWidth + 20) - sidePadding
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, sidePadding)
                        }
                        .content.offset(x: -scrollOffset) // Apply custom offset for "paging" effect
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    let dragThreshold: CGFloat = 50 // Minimum drag distance to trigger paging
                                    let bannerSpacing = bannerWidth + 20
                                    
                                    if value.translation.width < -dragThreshold, selectedIndex < items.count - 1 {
                                        // Swipe left
                                        selectedIndex += 1
                                    } else if value.translation.width > dragThreshold, selectedIndex > 0 {
                                        // Swipe right
                                        selectedIndex -= 1
                                    }
                                    
                                    withAnimation {
                                        scrollOffset = CGFloat(selectedIndex) * bannerSpacing - sidePadding
                                    }
                                }
                        )
                    }//end of inner GeometryReader
                    .frame(height: 200)
                    Spacer()
                    VStack {
                        ForEach(1...10, id: \.self){ index in
                            ScheduleCell(day: index, selectedDay: $selectedDay).onTapGesture {
                                selectedDay = index
                            }
                            .modifier(ExerciseListViewModifier())
                        }
                    }
                }//end of VStack
               
            }//End of Scrollview
            .navigationTitle(items[selectedIndex].name)
            .navigationBarTitleDisplayMode(.automatic)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isShowingTrainingOptions = true
                        }
                    }) {
                        Image(systemName: "list.bullet") // Replace with your custom icon
                    }
                }
            }
            
        }//End of NavigationBar
        
        // Overlaying Detail View with sliding effect
        if isShowingTrainingOptions {
            TraingOptionsScreen(isShowingTraingOptions: $isShowingTrainingOptions, selectedIndex: $selectedIndex)
                .transition(.move(edge: .trailing)) // Slide in from right
                .zIndex(1) // Ensure DetailView appears above ContentView
        }
    }
}

#Preview {
    TrainingScreen()
}

// Sample Item Model
struct Item: Identifiable {
    let id: Int
    let name: String
    let image: String
}
