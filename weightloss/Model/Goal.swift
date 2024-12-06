//
//  Goal.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import Foundation
struct Goal : Identifiable, Hashable{
    let id = UUID()
    let name: String
    let icon: String
    var isSelected: Bool = false
    var isAnimate: Bool = false
}


