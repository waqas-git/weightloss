//
//  ProfileViewModel.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import Foundation
import UIKit
class ProfileViewModel: ObservableObject {
    @Published var selectedLanguage: String = "English"
    @Published var sections: [ProfileSections] = [
           // Backup & Restore Section
        ProfileSections(
               title: nil,
               items: [
                ProfileItem(icon: "cloud.fill", title: "Backup & Restore", subtitle: "Synchronize your data", actionIcon: "arrow.clockwise")
               ]
           ),
           
           // Workout Section
        ProfileSections(
               title: "Workout",
               items: [
                ProfileItem(icon: "bell", title: "Reminder", subtitle: nil, actionIcon: "plus"),
                ProfileItem(icon: "gearshape", title: "Workout Settings", subtitle: nil, actionIcon: nil)
               ]
           ),
           
           // General Settings Section
        ProfileSections(
               title: "General Settings",
               items: [
                ProfileItem(icon: "person.crop.circle", title: "My Profile", subtitle: nil, actionIcon: nil),
                ProfileItem(icon: "globe", title: "Language Options", subtitle: "English", actionIcon: nil),
                ProfileItem(icon: "heart", title: "Sync to Google Fit", subtitle: "Off", actionIcon: nil)
               ]
           ),
           
           // Support Us Section
        ProfileSections(
               title: "Support Us",
               items: [
                ProfileItem(icon: "paperplane", title: "Share With Friends", subtitle: nil, actionIcon: nil),
                ProfileItem(icon: "star", title: "Rate Us", subtitle: nil, actionIcon: nil),
                ProfileItem(icon: "pencil", title: "Feedback", subtitle: nil, actionIcon: nil),
                ProfileItem(icon: "eye", title: "Privacy Policy", subtitle: nil, actionIcon: nil)
               ]
           )
       ]
}
