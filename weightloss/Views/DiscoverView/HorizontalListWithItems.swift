//
//  HorizontalListWithItems.swift
//  weightloss
//
//  Created by waqas ahmed on 07/12/2024.
//

import SwiftUI

struct HorizontalListWithItems<Item: Hashable, Content: View>: View {
    let items: [Item]
    let rows: [GridItem]
    let cellWidth: CGFloat
    let cellSpacing: CGFloat
    let height: CGFloat
    let content: (Item) -> Content
    
    init(
        items: [Item],
        rows: [GridItem],
        cellWidth: CGFloat,
        cellSpacing: CGFloat = 10,
        height: CGFloat,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.rows = rows
        self.cellWidth = cellWidth
        self.cellSpacing = cellSpacing
        self.height = height
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: cellSpacing) {
                ForEach(items, id: \.self) { item in
                    content(item)
                        .frame(width: cellWidth)
                }
            }
            .padding(10)
        }
        .frame(height: height)
    }
}

#Preview {
    //HorizontalListWithItems()
}
