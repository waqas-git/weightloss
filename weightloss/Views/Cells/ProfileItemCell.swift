//
//  ProfileItemCell.swift
//  weightloss
//
//  Created by waqas ahmed on 06/11/2024.
//

import SwiftUI

struct ProfileItemCell: View {
    var item: ProfileItem
    var body: some View {
        HStack {
            // Icon
            Image(systemName: item.icon)
                .foregroundColor(.gray)
            
            // Title and subtitle
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                if let subtitle = item.subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.leading, 20)
            
            Spacer()
            
            // Action icon if available
            if let actionIcon = item.actionIcon {
                Image(systemName: actionIcon)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ProfileItemCell(item: ProfileItem(icon: "star", title: "Feedback", subtitle: "Rate us", actionIcon: "plus"))
}
