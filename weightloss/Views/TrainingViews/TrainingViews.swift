//
//  TrainingViews.swift
//  weightloss
//
//  Created by waqas ahmed on 05/11/2024.
//

import SwiftUI

struct TrainingViews: View{
    
        var body: some View {
            TabView {
                FullBodyWeightLossView()
                            .frame(width: UIScreen.main.bounds.width * 0.85) // Adjust for partial visibility
                            .padding(.horizontal, 20)
                        
                LeanBodybuildingView()
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .padding(.horizontal, 20)
                        
                ThighToningView()
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .padding(.horizontal, 20)
                        
                BellyFatBurnerView()
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .padding(.horizontal, 20)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: UIScreen.main.bounds.height * 0.8) // Adjust height as needed

        }
    }

    

#Preview {
    TrainingViews()
}

