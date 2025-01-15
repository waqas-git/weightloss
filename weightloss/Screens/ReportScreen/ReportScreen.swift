//
//  ReportScreen.swift
//  weightloss
//
//  Created by waqas ahmed on 03/11/2024.
//

import SwiftUI

struct ReportScreen: View {
    @State private var selectedTab: ReportTabs = .Calendar
    @State private var currentVisibleTab: ReportTabs = .Calendar
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                HStack{
                    TabButton(title: "Calendar", isSelected: currentVisibleTab == .Calendar) {
                        withAnimation {
                            selectedTab = .Calendar
                            currentVisibleTab = .Calendar
                        }
                    }
                    
                    TabButton(title: "Data", isSelected: currentVisibleTab == .Data) {
                        withAnimation {
                            selectedTab = .Data
                            currentVisibleTab = .Data
                        }
                    }
                    Spacer()
                }
                .padding(.top, 20)
                
                ScrollViewReader{ reader in
                    ScrollView{
                        VStack(spacing: 20){
                            VStack{
                                Text("Calendar Section")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                CalenderView()
                            }
                            .background(GeometryReader {geo in
                                Color.clear.onChange(of: geo.frame(in: .global).minY) { _ in
                                    updateVisibleTab(with: geo, id: .Calendar)
                                }
                            })
                            .id(ReportTabs.Calendar)
                            
                            VStack{
                                Text("Data Section")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                DataView()
                            }
                            .background(GeometryReader {geo in
                                Color.clear.onChange(of: geo.frame(in: .global).minY) { _ in
                                    updateVisibleTab(with: geo, id: .Data)
                                }
                            })
                            .id(ReportTabs.Data)
                        }
                        .padding()
                    }
                    .onChange(of: selectedTab) {tab in
                        withAnimation {
                            reader.scrollTo(tab, anchor: .top)
                        }
                    }
                }
            }
            //            .onChange(of: currentVisibleTab) {visibleTab in
            //                selectedTab = visibleTab
            //            }
            .navigationTitle("Report")
        }
    }
    
    private func updateVisibleTab(with geo: GeometryProxy, id: ReportTabs) {
        let frame = geo.frame(in: .global)
        if frame.minY < UIScreen.main.bounds.height / 2 && frame.maxY > 100 {
            currentVisibleTab = id
        }
    }
}

#Preview {
    ReportScreen()
}

struct TabButton: View{
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View{
        Button(action: action){
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? Color.black : Color.gray)
                .underline(isSelected)
        }
        .padding(.horizontal)
    }
}

struct CalenderView: View{
    var body: some View{
        VStack{
            HStack{
                ReportValues(value: 0, title: "Workout")
                Spacer()
                ReportValues(value: 0, title: "Kcal")
                Spacer()
                ReportValues(value: 0, title: "Time (min)")
            }
            HStack{
                Button(action: {
                    //viewModel.changeMonth(by: -1) // Move to the previous month
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                }
                Spacer()
                Text("January")
                    .font(.title2)
                
                Spacer()
                Button(action: {
                   // viewModel.changeMonth(by: 1) // Move to the next month
                }) {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .padding()
                }
            }
        }
    }
}

struct DataView: View{
    let items = ["Apple", "Banana", "Orange", "Grapes", "Apple", "Banana", "Orange", "Grapes", "Mango","Apple", "Banana", "Orange", "Grapes", "Mango", "Apple", "Banana", "Orange", "Grapes", "Mango","Apple", "Banana", "Orange", "Grapes", "Mango", "Apple", "Banana", "Orange", "Grapes", "Mango","Apple", "Banana", "Orange", "Grapes", "Mango"]
    var body: some View{
        ForEach(items, id: \.self){item in
            Text(item)
        }
    }
}

enum ReportTabs{
    case Calendar
    case Data
}
