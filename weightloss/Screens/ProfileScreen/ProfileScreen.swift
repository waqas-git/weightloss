//
//  ProfileScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject private var viewModel = ProfileViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                List{
                    ForEach(viewModel.sections){ section in
                        Section(header: Text(section.title ?? "").font(.headline).foregroundColor(.red)) {
                        // Loop through each item in the section
                                ForEach(section.items){item in
                                    ProfileItemCell(item: item)
                                    
                            }
                        }
                    }
                    .textCase(nil) // Prevents the section header from being capitalized
                }
                .listStyle(InsetGroupedListStyle()) // Optional: Customizes the list style to match iOS style
                .navigationTitle("ME")
            }
        }
    }
}

#Preview {
    ProfileScreen()
}
