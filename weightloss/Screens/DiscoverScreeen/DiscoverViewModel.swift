//
//  DiscoverViewModel.swift
//  weightloss
//
//  Created by waqas ahmed on 02/12/2024.
//

import Foundation

class DiscoverViewModel: ObservableObject {
    @Published var relaxStretchItems : [Goal] = []
    @Published var foryouItems : [ProfileItem] = []
    @Published var trainingGoalsItems : [Goal] = []
    @Published var focusGridItems : [Goal] = []
    @Published var durationAndIntensityItems : [ProfileSections] = []
    
    init () {
        loadRelaxHStackItems()
        loadForyouHGridItems()
        loadTrainingGoalHStackItems()
        loadBodyFocusGridItems()
        loadDuration_IntensityItems()
    }
    func loadRelaxHStackItems() {
        relaxStretchItems = [
            Goal(name: "Full body \nstretching", icon: "relax_1"),
            Goal(name: "Lower back \nstretching", icon: "relax_2"),
            Goal(name: "Neck & Shoulder \nstretching", icon: "relax_3"),
            Goal(name: "Legs & Calves \nstretching", icon: "relax_4")
        ]
    }
    
    func loadForyouHGridItems() {
        foryouItems = [
            ProfileItem(icon: "morning_warmup", title: "Morning warm up", subtitle: "6 min", actionIcon: nil),
            ProfileItem(icon: "hamstring_exercise", title: "Hamstring full exercise", subtitle: "10 min", actionIcon: nil),
            ProfileItem(icon: "back_workout", title: "Full back workout", subtitle: "12 min . Beginner", actionIcon: nil),
            ProfileItem(icon: "morning_warmup", title: "Morning warm up", subtitle: "6 min", actionIcon: nil),
            ProfileItem(icon: "hamstring_exercise", title: "Hamstring full exercise", subtitle: "10 min", actionIcon: nil),
            ProfileItem(icon: "back_workout", title: "Full back workout", subtitle: "12 min . Beginner", actionIcon: nil),
            ProfileItem(icon: "morning_warmup", title: "Morning warm up", subtitle: "6 min", actionIcon: nil),
            ProfileItem(icon: "hamstring_exercise", title: "Hamstring full exercise", subtitle: "10 min", actionIcon: nil),
        ]
    }
    
    func loadTrainingGoalHStackItems() {
        trainingGoalsItems = [
            Goal(name: "Fat Burning", icon: "single_image"),
            Goal(name: "Angel body", icon: "single_pic"),
            Goal(name: "Relax", icon: "without_bg"),
            Goal(name: "Sexy booty", icon: "single_image")
        ]
    }
    
    func loadBodyFocusGridItems() {
        focusGridItems = [
            Goal(name: "Full body", icon: "without_bg"),
            Goal(name: "Arm", icon: "without_bg"),
            Goal(name: "Core", icon: "without_bg"),
            Goal(name: "Butt & legs", icon: "without_bg")
        ]
    }
    
    func loadDuration_IntensityItems(){
        durationAndIntensityItems = [
            // Workout Section
            ProfileSections(
                title: "Duration",
                items: [
                    ProfileItem(icon: "clock.circle.fill", title: "Less than 7 minutes", subtitle: nil, actionIcon: nil),
                    ProfileItem(icon: "clock.circle.fill", title: "Longer than 7 minutes", subtitle: nil, actionIcon: nil)
                ]
            ),
            
            // General Settings Section
            ProfileSections(
                title: "Intensity",
                items: [
                    ProfileItem(icon: "lineweight", title: "Begginers", subtitle: nil, actionIcon: nil),
                    ProfileItem(icon: "lineweight", title: "Intermediate", subtitle: nil, actionIcon: nil),
                    ProfileItem(icon: "lineweight", title: "Advanced", subtitle: nil, actionIcon: nil)
                ]
            )
        ]
    }

    
}
