//
//  TraingOptionsScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import SwiftUI

struct TraingOptionsScreen: View {
    let imageNames: [String] = ["full-1", "lean-2", "thigh-3", "belly-4"]
    @Binding var isShowingTraingOptions: Bool
    @Binding var selectedIndex : Int
    var body: some View {
        ZStack{
            NavigationStack{
                
                List { // Vertical stack with spacing between images
                    ForEach(imageNames.indices, id: \.self) { index in
                        BannerImage(image: imageNames[index], height: 150, paddingTop: 0, cornerRadius: 15, padding: 10).onTapGesture {
                            selectedIndex = index
                            isShowingTraingOptions = false
                            print("index: \(index)")
                        }
                        .modifier(ExerciseListViewModifier())
                    }
                }
                .listStyle(.plain)
                
                .navigationTitle("Select Training Plan")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true) // Hide default back button
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                isShowingTraingOptions = false
                            }
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black) // Set the icon color to black
                                    .font(.system(size: 20, weight: .medium)) // Customize icon size and weight
                            }
                        }
                    }
                }
            }
        }
        .offset(x: isShowingTraingOptions ? 0 : UIScreen.main.bounds.width) // Start from the right
        .animation(.easeInOut, value: isShowingTraingOptions) // Smooth animation for sliding effect
    }
}

#Preview {
    TraingOptionsScreen(isShowingTraingOptions: .constant(true), selectedIndex: .constant(0))
}
