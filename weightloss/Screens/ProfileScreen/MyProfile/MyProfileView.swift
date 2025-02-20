//
//  MyProfileView.swift
//  weightloss
//
//  Created by waqas ahmed on 16/01/2025.
//

import SwiftUI

struct MyProfileView: View {
    @Binding var isKilograms: Bool
    @State private var connectAppleHealth = true
    @State var isPresented: Bool = false
    @StateObject private var viewModel = ProfileViewModel()
    @State private var selectedFeet = 5
    @State private var selectedInches = 8
    @State private var seletectItem : MyProfileData?
    var body: some View {
        VStack(spacing: 20){
            VStack(spacing: 8){
                Text("My Profile")
                    .font(.system(size: 26, weight: .bold))
                
                Text("Let us know you better to help boost your workout results")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 30)
            
            HStack(spacing: 8){
                ZStack {
                    Rectangle()
                        .fill(Color(.systemGray6))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    
                    HStack{
                        Rectangle()
                            .fill(Color(.green))
                            .frame(width: 150, height: 50)
                            .cornerRadius(10)
                            .offset(x: isKilograms ? 75 : -75)
                            .animation(.easeInOut(duration: 0.1), value: isKilograms)
                    }
                    
                    HStack{
                        Text("Kg,cm")
                            .frame(width: 150, alignment: .center)
                            .foregroundStyle(isKilograms ? Color.black : Color.white)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isKilograms.toggle()
                                }
                            }
                        
                        Text("lb,ft")
                            .frame(width: 150, alignment: .center)
                            .foregroundStyle(isKilograms ? Color.white : Color.black)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isKilograms.toggle()
                                }
                            }
                    }
                }
                
                
                //                Button {
                //                    isImperial = false
                //                } label: {
                //                    Text("Kg,cm")
                //                        .frame(width: .infinity)
                //                        .padding()
                //                        .background(isImperial ? Color(.systemGray6) : Color.green)
                //                        .foregroundStyle(isImperial ? Color.black : Color.white)
                //                        .cornerRadius(10)
                //                }
                //
                //                Button {
                //                    isImperial = true
                //                } label: {
                //                    Text("lb,ft")
                //                        .frame(width: .infinity)
                //                        .padding()
                //                        .background(isImperial ? Color.green : Color(.systemGray6))
                //                        .foregroundStyle(isImperial ? Color.white : Color.black)
                //                        .cornerRadius(10)
                //                }
            }
            .padding(.horizontal)
            
            HStack{
                ZStack(alignment: .topTrailing){
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 24))
                        .padding(3)
                }
                
                Text("Connect Apple Health")
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                Toggle("", isOn: $connectAppleHealth)
                    .labelsHidden()
                
            }
            .padding(.horizontal)
            
            List{
                ForEach(viewModel.myProfileData){items in
                    MyProfileCell(topTitle: items.title, selectedValue: items.value)
                        .onTapGesture {
                            isPresented = true
                            self.seletectItem = items
                        }
                }
            }
            .listStyle(.plain)
            
            .overlay(content: {
                if let selectedItem = seletectItem {
                    ProfileBottomSheet(title: selectedItem.title, isPresented: $isPresented){
                        VStack {
                            HStack {
                                Picker("Feet", selection: $selectedFeet) {
                                    ForEach(3...7, id: \.self) { Text("\($0) '").tag($0) }
                                }
                                .pickerStyle(WheelPickerStyle())
                                
                                Picker("Inches", selection: $selectedInches) {
                                    ForEach(0...11, id: \.self) { Text("\($0) \"").tag($0) }
                                }
                                .pickerStyle(WheelPickerStyle())
                            }
                            .frame(height: 200)
                        }
                    }
                }
            })
        }
    }
}

#Preview {
    MyProfileView(isKilograms: .constant(false))
    //ProfileField(value: "173 cm")
}

