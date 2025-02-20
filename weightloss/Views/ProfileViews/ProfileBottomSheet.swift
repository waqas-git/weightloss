//
//  ProfileBottomSheet.swift
//  weightloss
//
//  Created by waqas ahmed on 05/02/2025.
//

import SwiftUI

//<Content: View> is generic view. Its means bottom sheet can accept any type of view to show in it.
struct ProfileBottomSheet<Content: View>: View {
    let content: Content
    let title : String
    @Binding var isPresented: Bool
    
    init(title: String, isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.headline)
                    .padding(.leading, 20)
                Spacer()
                Button (action: {
                    isPresented = false
                }){
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.black)
                        .padding(.trailing, 20)
                }
            }
            .padding(.top, 10)
            
            Divider()
            content
            
            Button(action: {
                isPresented = false
            }) {
                Text("SAVE")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .padding(20)
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var isPresented = true  // Create a State variable
    
    return ProfileBottomSheet(title: "Height", isPresented: $isPresented) {
        Text("This is the bottom sheet content")
    }
}
