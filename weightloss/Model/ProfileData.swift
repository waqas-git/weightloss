//
//  ProfileData.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import Foundation
struct ProfileItem: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String?
    let actionIcon: String?
}

// Model for each section containing a list of SettingItems
struct ProfileSections: Identifiable, Hashable {
    let id = UUID()
    let title: String?
    let items: [ProfileItem]
}


struct MyProfileData : Identifiable, Hashable {
    var id = UUID()
    var type : MyProfileItemsType
    var title: String
    var value : String
}

public enum MyProfileItemsType {
   case height, weight, gender

}
